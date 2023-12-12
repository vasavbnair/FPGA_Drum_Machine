`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 07:09:21 PM
// Design Name: 
// Module Name: pos_edge_detect
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


module pos_edge_detect(input logic clk, signal, reset,
                       output logic align);
    logic button_ff, button_ff2;
    logic button_edge;
    always_ff @(posedge clk or posedge reset) 
    begin
        if(reset)
            begin
                button_ff <= signal;
                button_ff2 <= signal;
            end
        else
            begin
                button_ff <= signal;
                button_ff2 <= button_ff;
            end
    end
    assign align = button_ff && ~button_ff2; 
     
endmodule
