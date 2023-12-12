`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 03:35:14 PM
// Design Name: 
// Module Name: pwm
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

// 50 MHZ CLOCK 
module pwm(input logic clk,
    input logic [15:0] sample, 
    output logic right_channel,left_channel);
    
    logic [7:0] counter = 8'b0;
    // always ff loop that counts from 0 to 256
    //check if the count is less than right or left 
    //if count 255 set it back to zero else increment
    logic[7:0] pwmleft = sample[7:0];
    logic[7:0] pwmright = sample[15:8] ;

    always_ff @(posedge clk) 
    begin
        right_channel <= (counter < pwmright);
        left_channel <= (counter < pwmleft);
        if (counter == 8'hFF)
            begin
            counter <= 8'b0;
            end
        else
            begin
            counter <= counter + 1;
            end
  end   
endmodule
