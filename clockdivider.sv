`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 11:42:57 PM
// Design Name: 
// Module Name: clockdivider
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

//50Mhz
module clockdivider( input logic clkin, output logic clkout
    );

    always_ff @(posedge clkin)
        begin
        clkout <= ~clkout;
        end
    
endmodule


module clockdivider48(input logic clkin, output logic clkout,  output logic[15:0] counter);
    logic[15:0] count = 15'd0;
       
    always_ff @(posedge clkin)
        begin
        if (count == 15'd1042)
            begin
                clkout <= ~clkout;
                count <= 15'd0;
            end
        else
            begin                
                count <= count + 1;
            end
            counter <=count;
        end
endmodule 


