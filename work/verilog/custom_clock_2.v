/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module custom_clock_2 (
    input clk,
    input rst,
    output reg out
  );
  
  
  
  wire [32-1:0] M_a_value;
  counter_7 a (
    .clk(clk),
    .rst(rst),
    .value(M_a_value)
  );
  
  always @* begin
    out = M_a_value[25+0-:1];
  end
endmodule
