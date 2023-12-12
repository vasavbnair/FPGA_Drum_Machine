`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 01:44:53 PM
// Design Name: 
// Module Name: graphics_fsm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module graphics_fsm(input logic Clk, input logic [7:0] keycode, output logic [3:0] channelnum, output logic GO);
     // Internal state logic
	always_ff @ (posedge Clk)
	begin
				case (keycode)
					8'h1E :    //1
					   begin
						channelnum <= 0;
						GO <=1;
					   end
					8'h1F :    //2
					   begin
					    channelnum <= 1;
					    GO <=1;
					   end
					8'h20 :    //3
					   begin
					    channelnum <= 2;
					    GO <= 1;
					   end
					8'h21 :    //4
					   begin
					    channelnum <= 3;
					    GO <= 1;
					   end
					default: GO <=0;
				endcase
	
	end 
    
 endmodule
 
 module beatselect(input logic Clk, input logic Reset, input logic [7:0] keycode, input logic [3:0] channelnum, output logic [11:0] channel0,channel1,channel2,channel3);
 // make 4 1d registers
 //channel0, channel1, channel2, channel3 [11:0]
 always_ff @ (posedge Clk)
	begin
		  if (keycode ==8'h14) //Q
		      begin
		      if(channelnum == 0)
		          channel0[0] <= 1;
		      if(channelnum == 1)
		          channel1[0] <= 1;
		      if(channelnum == 2)
		          channel2[0] <= 1;
		      if(channelnum == 3)
		          channel3[0] <= 1;			
		      end
		  else if (keycode ==8'h1A )    //W
					begin
					   if (channelnum == 0 )
					       channel0[1] <= 1;
					   if (channelnum == 1 )
					       channel1[1] <= 1;
					   if (channelnum == 2 )
					       channel2[1] <= 1;
					   if (channelnum == 3 )
					       channel3[1] <= 1;    
				    end  
		 else if (keycode ==8'h8)      //E
					  begin
					   if (channelnum == 0 )
					       channel0[2] <= 1;
					   if (channelnum == 1 )
					       channel1[2] <= 1;
					   if (channelnum == 2 )
					       channel2[2] <= 1;
					   if (channelnum == 3 )
					       channel3[2] <= 1;    
				    end   
		else if (keycode ==8'h15)    //R
					  begin
					   if (channelnum == 0 )
					       channel0[3] <= 1;
					   if (channelnum == 1 )
					       channel1[3] <= 1;
					   if (channelnum == 2 )
					       channel2[3] <= 1;
					   if (channelnum == 3 )
					       channel3[3] <= 1;    
				    end    
		else if (keycode ==8'h17 )    //T
					  begin
					   if (channelnum == 0 )
					       channel0[4] <= 1;
					   if (channelnum == 1 )
					       channel1[4] <= 1;
					   if (channelnum == 2 )
					       channel2[4] <= 1;
					   if (channelnum == 3 )
					       channel3[4] <= 1;    
				    end  	
		else if (keycode ==8'h1C )    //Y
					  begin
					   if (channelnum == 0 )
					       channel0[5] <= 1;
					   if (channelnum == 1 )
					       channel1[5] <= 1;
					   if (channelnum == 2 )
					       channel2[5] <= 1;
					   if (channelnum == 3 )
					       channel3[5] <= 1;    
				    end     
		else if (keycode ==8'h18)    //U
					  begin
					   if (channelnum == 0 )
					       channel0[6] <= 1;
					   if (channelnum == 1 )
					       channel1[6] <= 1;
					   if (channelnum == 2 )
					       channel2[6] <= 1;
					   if (channelnum == 3 )
					       channel3[6] <= 1;    
				    end     
		else if (keycode ==8'hC)     //I
					  begin
					   if (channelnum == 0 )
					       channel0[7] <= 1;
					   if (channelnum == 1 )
					       channel1[7] <= 1;
					   if (channelnum == 2 )
					       channel2[7] <= 1;
					   if (channelnum == 3 )
					       channel3[7] <= 1;    
				    end     
		else if (keycode ==8'h12)    //O
					  begin
					   if (channelnum == 0 )
					       channel0[8] <= 1;
					   if (channelnum == 1 )
					       channel1[8] <= 1;
					   if (channelnum == 2 )
					       channel2[8] <= 1;
					   if (channelnum == 3 )
					       channel3[8] <= 1;    
				    end   
		else if (keycode ==8'h13)    //P
					  begin
					   if (channelnum == 0 )
					       channel0[9] <= 1;
					   if (channelnum == 1 )
					       channel1[9] <= 1;
					   if (channelnum == 2 )
					       channel2[9] <= 1;
					   if (channelnum == 3 )
					       channel3[9] <= 1;    
				    end     
		else if (keycode ==8'h2F)    //[
					  begin
					   if (channelnum == 0 )
					       channel0[10] <= 1;
					   if (channelnum == 1 )
					       channel1[10] <= 1;
					   if (channelnum == 2 )
					       channel2[10] <= 1;
					   if (channelnum == 3 )
					       channel3[10] <= 1;    
				    end   					    
		else if (keycode ==8'h30)    //]
					  begin
					   if (channelnum == 0 )
					       channel0[11] <= 1;
					   if (channelnum == 1 )
					       channel1[11] <= 1;
					   if (channelnum == 2 )
					       channel2[11] <= 1;
					   if (channelnum == 3 )
					       channel3[11] <= 1;    
				    end   
		  else if(keycode == 8'h27)
		  begin 
		        channel0 <= '0;
				channel1 <= '0;
				channel2 <= '0;
				channel3 <= '0;
		  end
//				case (keycode)
//					8'h14 :    //Q
//					begin
					
//				  	   if (channelnum == 0 )
//					       channel0[0] <= 1;
//					   if (channelnum == 1 )
//					       channel1[0] <= 1;
//					   if (channelnum == 2 )
//					       channel2[0] <= 1;
//					   if (channelnum == 3 )
//					       channel3[0] <= 1;    
				    end      	
//					8'h1A :    //W
//					begin
//					   if (channelnum == 0 )
//					       channel0[1] <= 1;
//					   if (channelnum == 1 )
//					       channel1[1] <= 1;
//					   if (channelnum == 2 )
//					       channel2[1] <= 1;
//					   if (channelnum == 3 )
//					       channel3[1] <= 1;    
//				    end  
//					8'h8:      //E
//					  begin
//					   if (channelnum == 0 )
//					       channel0[2] <= 1;
//					   if (channelnum == 1 )
//					       channel1[2] <= 1;
//					   if (channelnum == 2 )
//					       channel2[2] <= 1;
//					   if (channelnum == 3 )
//					       channel3[2] <= 1;    
//				    end   
//					8'h15 :    //R
//					  begin
//					   if (channelnum == 0 )
//					       channel0[3] <= 1;
//					   if (channelnum == 1 )
//					       channel1[3] <= 1;
//					   if (channelnum == 2 )
//					       channel2[3] <= 1;
//					   if (channelnum == 3 )
//					       channel3[3] <= 1;    
//				    end    
//					8'h17 :    //T
//					  begin
//					   if (channelnum == 0 )
//					       channel0[4] <= 1;
//					   if (channelnum == 1 )
//					       channel1[4] <= 1;
//					   if (channelnum == 2 )
//					       channel2[4] <= 1;
//					   if (channelnum == 3 )
//					       channel3[4] <= 1;    
//				    end  	
//					8'h1C :    //Y
//					  begin
//					   if (channelnum == 0 )
//					       channel0[5] <= 1;
//					   if (channelnum == 1 )
//					       channel1[5] <= 1;
//					   if (channelnum == 2 )
//					       channel2[5] <= 1;
//					   if (channelnum == 3 )
//					       channel3[5] <= 1;    
//				    end     
//					8'h18 :    //U
//					  begin
//					   if (channelnum == 0 )
//					       channel0[6] <= 1;
//					   if (channelnum == 1 )
//					       channel1[6] <= 1;
//					   if (channelnum == 2 )
//					       channel2[6] <= 1;
//					   if (channelnum == 3 )
//					       channel3[6] <= 1;    
//				    end     
//					8'hC :     //I
//					  begin
//					   if (channelnum == 0 )
//					       channel0[7] <= 1;
//					   if (channelnum == 1 )
//					       channel1[7] <= 1;
//					   if (channelnum == 2 )
//					       channel2[7] <= 1;
//					   if (channelnum == 3 )
//					       channel3[7] <= 1;    
//				    end     
//					8'h12 :    //O
//					  begin
//					   if (channelnum == 0 )
//					       channel0[8] <= 1;
//					   if (channelnum == 1 )
//					       channel1[8] <= 1;
//					   if (channelnum == 2 )
//					       channel2[8] <= 1;
//					   if (channelnum == 3 )
//					       channel3[8] <= 1;    
//				    end   
//					8'h13 :    //P
//					  begin
//					   if (channelnum == 0 )
//					       channel0[9] <= 1;
//					   if (channelnum == 1 )
//					       channel1[9] <= 1;
//					   if (channelnum == 2 )
//					       channel2[9] <= 1;
//					   if (channelnum == 3 )
//					       channel3[9] <= 1;    
//				    end     
//					8'h2F :    //[
//					  begin
//					   if (channelnum == 0 )
//					       channel0[10] <= 1;
//					   if (channelnum == 1 )
//					       channel1[10] <= 1;
//					   if (channelnum == 2 )
//					       channel2[10] <= 1;
//					   if (channelnum == 3 )
//					       channel3[10] <= 1;    
//				    end   					    
//					8'h30 :    //]
//					  begin
//					   if (channelnum == 0 )
//					       channel0[11] <= 1;
//					   if (channelnum == 1 )
//					       channel1[11] <= 1;
//					   if (channelnum == 2 )
//					       channel2[11] <= 1;
//					   if (channelnum == 3 )
//					       channel3[11] <= 1;    
//				    end     
//					8'h1E :  ;
//					8'h1F :  ;
//					8'h20 :  ;
//					8'h21 : ;     
//				endcase
//	           end
//	end 
 
 
 
 
    
// always_ff @ (posedge Clk)
//	begin
//				case (keycode)
//					8'h14 :    //Q
//					  beatarray[channelnum][0] <= 1;	
//					8'h1A :    //W
//					  beatarray[channelnum][1] <= 1;  
//					8'h8:      //E
//					  beatarray[channelnum][2] <= 1;  
//					8'h15 :    //R
//					  beatarray[channelnum][3] <= 1;   
//					8'h17 :    //T
//					  beatarray[channelnum][4] <= 1; 	
//					8'h1C :    //Y
//					  beatarray[channelnum][5] <= 1;   
//					8'h18 :    //U
//					  beatarray[channelnum][6] <= 1;   
//					8'hC :     //I
//					  beatarray[channelnum][7] <= 1;   
//					8'h12 :    //O
//					  beatarray[channelnum][8] <= 1; 
//					8'h13 :    //P
//					  beatarray[channelnum][9] <= 1;   
//					8'h2F :    //[
//					  beatarray[channelnum][10] <= 1; 					    
//					8'h30 :    //]
//					  beatarray[channelnum][11] <= 1;   
//					8'h1E :  ;
//					8'h1F :  ;
//					8'h20 :  ;
//					8'h21 : ;     
//				endcase
	
//	end 
     

//	enum logic [4:0] {  Halted, 
//						S_1,S_2,S_3,S_4,S_5,S_6,S_7,S_8,S_9,S_10,S_11,S_12,S_13,S_14}   State, Next_state;   // Internal state logic
	
	
//    logic count = 1'b0;
	
		
//	always_ff @ (posedge Clk)
//	begin
	    
//		if (Reset) 
//			State <= Halted;
//		//else if(keycode)
//		  State <= Next_state;
//	end
//	always_comb
//	begin   
//		// Default next state is staying at current state
//		Next_state = State;
//		// Assign next state
//		unique case (State)
//			Halted :  //clear the board
//			     Next_state = S_1;
//		    S_1 : 
//				case (keycode)
//					8'h14 :    //Q
//						Next_state = S_3;
//					8'h1A :    //W
//					    Next_state = S_4;
//					8'h8:    //E
//					    Next_state = S_5;
//					8'h15 :    //R
//					    Next_state = S_6;
//					8'h17 :    //T
//					    Next_state = S_7;
//					8'h1C :    //Y
//					    Next_state = S_8;
//					8'h18 :    //U
//					    Next_state = S_9;
//					8'hC :    //I
//				        Next_state = S_10;
//				    8'h12 :    //O
//				        Next_state = S_11;
//				    8'h13 :    //P
//					    Next_state = S_12;
//					8'h2F :    //[
//					    Next_state = S_13;			    
//					8'h30 :    //]
//					    Next_state = S_14;           
//					default : 
//						Next_state = S_2; //s_2 goes back to s_1
//				endcase
//			S_2 : 
//				Next_state = S_1; 
//			S_3 :                
//				Next_state = S_1;   
//			S_4 :
//			    Next_state = S_1;
//			S_5:
//			    Next_state = S_1;
//			S_6 : 
//				Next_state = S_1;
//			S_7 : 				
//				Next_state = S_1;
//			S_8 : 
//				Next_state = S_1;
//			S_9 :
//			    Next_state = S_1;
//			S_10 :
//			    Next_state = S_1;
//			S_11 :
//			    Next_state = S_1;
//			S_12 :
//			    Next_state = S_1;
//			S_13 :
//			    Next_state = S_1;
//			S_14 :
//			    Next_state = S_1;			
//			default :
//			    Next_state = S_1;
//		endcase
//		case (State)
//			Halted: ; 
//			S_2: ;
//			S_3 : beatarray[channelnum][0] <= 1;
//			S_4 : beatarray[channelnum][1] <= 1;	
//            S_5 : beatarray[channelnum][2] <= 1;
//            S_6 : beatarray[channelnum][3] <= 1;
//            S_7 : beatarray[channelnum][4] <= 1;
//            S_8 : beatarray[channelnum][5] <= 1;
//            S_9 : beatarray[channelnum][6] <= 1;
//            S_10 : beatarray[channelnum][7] <= 1;
//            S_11 : beatarray[channelnum][8] <= 1;
//            S_12 : beatarray[channelnum][9] <= 1;
//            S_13 : beatarray[channelnum][10] <= 1;
//            S_14 : beatarray[channelnum][11] <= 1;
            
//			default : ;
//		endcase
//	end 
    
 endmodule




