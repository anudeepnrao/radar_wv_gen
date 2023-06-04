`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.05.2023 10:19:06
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(aclk,aresetn,freq,m_axis_data_tvalid,m_axis_phase_tvalid,
sine,cos,
PW_IN,PRI_IN
    );
input wire aclk,aresetn;// input signals
  output wire m_axis_data_tvalid,m_axis_phase_tvalid;
 wire [31:0] m_axis_data_tdata;
 output wire [11:0]sine, cos;
 input [15:0]PW_IN,PRI_IN;
 input wire [9:0] freq;
 wire Pulse_OUT;
 wire s_axis_phase_tvalid=1'b1;
 wire [16:0] phase_inc;
 phase_gen PHG1(aclk, freq, phase_inc,aresetn);
    dds_compiler_0 phase_acc (
  .aclk(aclk),                                // input wire aclk
  .aresetn(aresetn),                          // input wire aresetn
  .s_axis_phase_tvalid(s_axis_phase_tvalid),  // input wire s_axis_phase_tvalid
  .s_axis_phase_tdata(phase_inc),    // input wire [16 : 0] s_axis_phase_tdata
  .m_axis_data_tvalid(m_axis_data_tvalid),    // output wire m_axis_data_tvalid
  .m_axis_data_tdata(m_axis_data_tdata),      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_phase_tvalid(m_axis_phase_tvalid),  // output wire m_axis_phase_tvalid
  .m_axis_phase_tdata(m_axis_phase_tdata)    // output wire [15 : 0] m_axis_phase_tdata
);
Pulse_Gen PG1(aclk, // 100MHz clock input 
 PW_IN,
 PRI_IN,
 Pulse_OUT,// PWM output signal 
    aresetn);
assign {sine,cos}=Pulse_OUT?{m_axis_data_tdata[27:16],m_axis_data_tdata[11:0]}:{12'd0,12'd0};
endmodule
