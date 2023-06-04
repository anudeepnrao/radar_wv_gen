`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2023 11:20:40
// Design Name: 
// Module Name: phase_gen
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


module phase_gen( aclk, freq, phase_inc,aresetn

    );
    input  [9:0]freq;
    input aclk,aresetn;
    output reg [16:0] phase_inc;
    reg [9:0]frq;
    parameter phi1k = 1.3107;
    always @(posedge aclk) begin
    if(!aresetn)
    phase_inc<=0;
    else begin
    frq<=freq;
    phase_inc<=$rtoi(frq*phi1k);
    end
    end
endmodule
