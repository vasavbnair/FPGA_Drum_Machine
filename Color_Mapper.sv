//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Zuofu Cheng   08-19-2023                               --
//                                                                       --
//    Fall 2023 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input  logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size,input logic [3:0] channelnum,
                       input logic [11:0] channel0, channel1, channel2,channel3,
                       output logic [3:0]  Red, Green, Blue );
    parameter SQUARE_SIZE = 40;
    parameter GRID_WIDTH = 13; 
    parameter GRID_HEIGHT = 4;
    parameter SPACING = 2;
    parameter TOP_LEFT_X = 50;
    parameter TOP_LEFT_Y = 150;

    
    logic ball_on;
	logic in_grid;
	int col, row;
	int square_x,square_y;

 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*BallS, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))
       )

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 120 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
    assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;

    
  
    always_comb
    begin:Ball_on_proc
        if ((DrawX >= BallX - Size/4) &&(DrawX <= BallX + Size/4) &&(DrawY >= BallY - 6*Size) &&(DrawY <= BallY + 6*Size)) // x^2 + y^2 = r^2
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 
       
    always_comb
    begin:RGB_Display
        Red = 4'h59; 
        Green = 4'h59;
        Blue = 4'h59;
        if ((ball_on == 1'b1)) begin 
            Red = 4'hf;
            Green = 4'h7;
            Blue = 4'h0;
        end    
        else begin     
        in_grid = 1'b0;
        for (col = 0; col < GRID_WIDTH; col++ )begin
            for (row = 0; row < GRID_HEIGHT; row++) begin
            square_x =  TOP_LEFT_X + (col * (SQUARE_SIZE + SPACING));
            square_y = TOP_LEFT_Y + (row * (SQUARE_SIZE + SPACING));
                if ((DrawX >= square_x) && (DrawX < square_x + SQUARE_SIZE) &&(DrawY >= square_y) 
                && (DrawY < square_y + SQUARE_SIZE)) 
                begin//if keycode for channel is pressed highlight the first block of the respective channel
                    if (col == 0) 
                        begin //first column represents the channels              
                            Red = 4'h3f;// set it to the default column color          
                            Green = 4'h91;
                            Blue = 4'h45;
                            if(row == channelnum)
                                begin
                                    Red = 4'hfc;
                                    Green = 4'hd5;
                                    Blue = 4'he;
                                end    
                        end
                    else 
                        begin
                                    // Default square color
                                    Red = 4'h74;
                                    Green = 4'h74;
                                    Blue = 4'h74; 
                                    
                                    if (row == 0 && channel0[col-1]==1)
                                        begin
                                            Red = 4'hFF;
                                            Green = 4'hCD;
                                            Blue = 4'h0;  
                                        end
                                    else if (row == 1 && channel1[col-1]==1)
                                        begin
                                            Red = 4'hFF;
                                            Green = 4'hCD;
                                            Blue = 4'h0;  
                                        end
                                    else if (row == 2 && channel2[col-1]==1)
                                        begin
                                            Red = 4'hFF;
                                            Green = 4'hCD;
                                            Blue = 4'h0;  
                                        end
                                    else if (row == 3 && channel3[col-1]==1)
                                        begin
                                            Red = 4'hFF;
                                            Green = 4'hCD;
                                            Blue = 4'h0;  
                                        end                              
                        end
                end
               
            end
        end
    end      
           
    end 
    
endmodule
