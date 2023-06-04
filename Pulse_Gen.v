module Pulse_Gen
 (
 clk, // 100MHz clock input 
 PW,
 PRI_IN,
 Pulse_OUT // PWM output signal 
    );
 input clk;
 input reg[3:0] PW; // duty cycle 
 input reg[7:0] PRI_IN;
 output Pulse_OUT;
 reg[3:0] PRI;// counter for creating 10Mhz PWM signal
 
// Create  PWM signal with variable pulse width 
 always @(posedge clk)
 begin
   PRI <= PRI + 1;
   if(PRI>=PRI_IN) 
    PRI <= 0;
 end
 assign Pulse_OUT = PRI < PW ? 1:0;
endmodule
