//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Zuofu Cheng   08-19-2023                               --
//    Fall 2023 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI Lab                                --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------
module pause(input logic Clk, input logic [7:0] keycode, output logic[1:0] pause);
    always_ff @ (posedge Clk)
	   begin
				case (keycode)
					8'h2C :    //1
					   begin
						pause  <= 1;
					   end
					8'h28 :    //1
					   begin
						pause  <= 0;
					   end
			     endcase
			    
        end
endmodule

module cursorcheck(input logic Clk,input logic [9:0]  BallX, 
input logic [3:0] channelnum,
input logic [11:0] channel0, channel1, channel2,channel3,
output logic[3:0] soundselect, 
output logic GO);
    
    always_ff @ (posedge Clk)
	begin 
	      soundselect<= channelnum;
		  if(BallX == 92 ) //col 1
		      begin
		          if(channel0[0]==1 && channel1[0]==1&&channel2[0]==1&&channel3[0]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[0]==1&&channel2[0]==1&&channel3[0]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[0]==1 && channel2[0]==1&&channel3[0]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[0]==1 && channel1[0]==1&&channel3[0]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[0]==1 && channel1[0]==1&&channel2[0]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[0]==1&&channel3[0]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[0]==1&&channel3[0]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[0]==1&&channel2[0]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[0]==1&&channel3[0]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[0]==1 &&channel2[0]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[0]==1 && channel1[0]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[0]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[0]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[0]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[0]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
		  else if(BallX == 134) //col2
		      begin
		          if(channel0[1]==1 && channel1[1]==1&&channel2[1]==1&&channel3[1]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[1]==1&&channel2[1]==1&&channel3[1]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[1]==1 && channel2[1]==1&&channel3[1]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[1]==1 && channel1[1]==1&&channel3[1]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[1]==1 && channel1[1]==1&&channel2[1]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[1]==1&&channel3[1]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[1]==1&&channel3[1]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[1]==1&&channel2[1]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[1]==1&&channel3[1]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[1]==1 &&channel2[1]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[1]==1 && channel1[1]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[1]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[1]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[1]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[1]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
		  else if(BallX == 176)
		      begin
		          if(channel0[2]==1 && channel1[2]==1&&channel2[2]==1&&channel3[2]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[2]==1&&channel2[2]==1&&channel3[2]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[2]==1 && channel2[2]==1&&channel3[2]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[2]==1 && channel1[2]==1&&channel3[2]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[2]==1 && channel1[2]==1&&channel2[2]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[2]==1&&channel3[2]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[2]==1&&channel3[2]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[2]==1&&channel2[2]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[2]==1&&channel3[2]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[2]==1 &&channel2[2]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[2]==1 && channel1[2]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[2]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[2]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[2]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[2]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
		  else if(BallX == 218)
		      begin
		          if(channel0[3]==1 && channel1[3]==1&&channel2[3]==1&&channel3[3]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[3]==1&&channel2[3]==1&&channel3[3]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[3]==1 && channel2[3]==1&&channel3[3]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[3]==1 && channel1[3]==1&&channel3[3]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[3]==1 && channel1[3]==1&&channel2[3]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[3]==1&&channel3[3]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[3]==1&&channel3[3]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[3]==1&&channel2[3]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[3]==1&&channel3[3]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[3]==1 &&channel2[3]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[3]==1 && channel1[3]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[3]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[3]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[3]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[3]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end   
	      else if(BallX == 260)
		      begin
		          if(channel0[4]==1 && channel1[4]==1&&channel2[4]==1&&channel3[4]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[4]==1&&channel2[4]==1&&channel3[4]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[4]==1 && channel2[4]==1&&channel3[4]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[4]==1 && channel1[4]==1&&channel3[4]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[4]==1 && channel1[4]==1&&channel2[4]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[4]==1&&channel3[4]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[4]==1&&channel3[4]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[4]==1&&channel2[4]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[4]==1&&channel3[4]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[4]==1 &&channel2[4]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[4]==1 && channel1[4]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[4]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[4]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[4]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[4]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
	      else if(BallX == 302 )
		      begin
		          if(channel0[5]==1 && channel1[5]==1&&channel2[5]==1&&channel3[5]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[5]==1&&channel2[5]==1&&channel3[5]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[5]==1 && channel2[5]==1&&channel3[5]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[5]==1 && channel1[5]==1&&channel3[5]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[5]==1 && channel1[5]==1&&channel2[5]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[5]==1&&channel3[5]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[5]==1&&channel3[5]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[5]==1&&channel2[5]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[5]==1&&channel3[5]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[5]==1 &&channel2[5]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[5]==1 && channel1[5]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[5]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[5]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[5]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[5]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
	      else if(BallX == 344)
		      begin
		          if(channel0[6]==1 && channel1[6]==1&&channel2[6]==1&&channel3[6]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[6]==1&&channel2[6]==1&&channel3[6]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[6]==1 && channel2[6]==1&&channel3[6]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[6]==1 && channel1[6]==1&&channel3[6]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[6]==1 && channel1[6]==1&&channel2[6]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[6]==1&&channel3[6]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[6]==1&&channel3[6]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[6]==1&&channel2[6]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[6]==1&&channel3[6]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[6]==1 &&channel2[6]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[6]==1 && channel1[6]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[6]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[6]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[6]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[6]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
	      else if(BallX == 386 && channel0[7]==1)
		      begin
		          if(channel0[7]==1 && channel1[7]==1&&channel2[7]==1&&channel3[7]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[7]==1&&channel2[7]==1&&channel3[7]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[7]==1 && channel2[7]==1&&channel3[7]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[7]==1 && channel1[7]==1&&channel3[7]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[7]==1 && channel1[7]==1&&channel2[7]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[7]==1&&channel3[7]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[7]==1&&channel3[7]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[7]==1&&channel2[7]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[7]==1&&channel3[7]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[7]==1 &&channel2[7]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[7]==1 && channel1[7]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[7]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[7]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[7]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[7]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end 
	      else if(BallX == 428)
		      begin
		          if(channel0[8]==1 && channel1[8]==1&&channel2[8]==1&&channel3[8]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[8]==1&&channel2[8]==1&&channel3[8]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[8]==1 && channel2[8]==1&&channel3[8]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[8]==1 && channel1[8]==1&&channel3[8]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[8]==1 && channel1[8]==1&&channel2[8]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[8]==1&&channel3[8]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[8]==1&&channel3[8]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[8]==1&&channel2[8]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[8]==1&&channel3[8]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[8]==1 &&channel2[8]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[8]==1 && channel1[8]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[8]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[8]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[8]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[8]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end 
	      else if(BallX == 470)
		      begin
		          if(channel0[9]==1 && channel1[9]==1&&channel2[9]==1&&channel3[9]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[9]==1&&channel2[9]==1&&channel3[9]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[9]==1 && channel2[9]==1&&channel3[9]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[9]==1 && channel1[9]==1&&channel3[9]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[9]==1 && channel1[9]==1&&channel2[9]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[9]==1&&channel3[9]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[9]==1&&channel3[9]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[9]==1&&channel2[9]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[9]==1&&channel3[9]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[9]==1 &&channel2[9]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[9]==1 && channel1[9]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[9]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[9]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[9]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[9]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
	      else if(BallX == 512)
		      begin
		          if(channel0[10]==1 && channel1[10]==1&&channel2[10]==1&&channel3[10]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[10]==1&&channel2[10]==1&&channel3[10]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[10]==1 && channel2[10]==1&&channel3[10]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[10]==1 && channel1[10]==1&&channel3[10]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[10]==1 && channel1[10]==1&&channel2[10]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[10]==1&&channel3[10]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[10]==1&&channel3[10]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[10]==1&&channel2[10]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[10]==1&&channel3[10]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[10]==1 &&channel2[10]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[10]==1 && channel1[10]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[10]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[10]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[10]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[10]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
	      else if(BallX == 554)
		       begin
		          if(channel0[11]==1 && channel1[11]==1&&channel2[11]==1&&channel3[11]==1)//1234
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel1[11]==1&&channel2[11]==1&&channel3[11]==1)//234
		              begin
		                  soundselect<=13;
		                  GO <=1;
		              end
		          else if(channel0[11]==1 && channel2[11]==1&&channel3[11]==1)//134
		              begin
		                  soundselect<=12;
		                  GO <=1;
		              end
		          else if(channel0[11]==1 && channel1[11]==1&&channel3[11]==1) //124
		              begin
		                  soundselect<=11;
		                  GO <=1;
		              end
		          else if(channel0[11]==1 && channel1[11]==1&&channel2[11]==1) //123
		              begin
		                  soundselect<=10;
		                  GO <=1;
		              end
		          else if(channel2[11]==1&&channel3[11]==1)//34
		              begin
		                  soundselect<=9;
		                  GO <=1;
		              end  
		          else if(channel1[11]==1&&channel3[11]==1)
		              begin
		                  soundselect<=8;
		                  GO <=1;
		              end
		          else if(channel1[11]==1&&channel2[11]==1)
		              begin
		                  soundselect<=7;
		                  GO <=1;
		              end
		          else if(channel0[11]==1&&channel3[11]==1)
		              begin
		                  soundselect<=6;
		                  GO <=1;
		              end
		          else if(channel0[11]==1 &&channel2[11]==1)//13
		              begin
		                  soundselect<=14;
		                  GO <=1;
		              end
		          else if(channel0[11]==1 && channel1[11]==1)//12
		              begin
		                  soundselect<=4;
		                  GO <=1;
		              end
		          else if(channel3[11]==1)
		              begin
		                  soundselect<=3;
		                  GO<=1;
		              end
		          else if(channel2[11]==1)
		              begin
		                  soundselect<=2;
		                  GO<=1;
		              end
		          else if(channel1[11]==1)
		              begin
		                  soundselect<=1;
		                  GO<=1;
		              end
		          else if(channel0[11]==1)
		              begin
		                  soundselect<=0;
		                  GO<=1;
		              end
		      end
	      else
	          GO<=0;	       
	end 


endmodule

module  ball ( input logic Reset, frame_clk,
               input logic [1:0] pause,
               output logic [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_X_Motion, Ball_Y_Motion;
	 
    parameter [9:0] Ball_X_Center=320;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=80;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=600;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign BallS = 16;  // default ball size
    
   
    always_ff @ (posedge frame_clk or posedge Reset) //make sure the frame clock is instantiated correctly
    begin: Move_Ball
        if (Reset)  // asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
			Ball_X_Motion <= 10'd1; //Ball_X_Step;
			BallY <= Ball_Y_Center;
			BallX <= Ball_X_Center;
        end
           
        else 
        begin 					  
				 if ( (BallX + BallS) >= Ball_X_Max )  // Ball is at the Right edge, TELEPORT!
				      begin
					  BallX <= (Ball_X_Min);
					  end
				 else
				    begin
				        if(pause == 1)
				            begin
				                BallX <= BallX + 0;
				            end
				        else
				            begin
				                Ball_X_Motion <= 1;
                                Ball_Y_Motion <= 0;
                                BallX <= (BallX + Ball_X_Motion);
                        end
                    end
				 BallY <= (BallY + Ball_Y_Motion);  // Update ball position
				 
				 
				 
					  
			
		end  
    end
      
endmodule
