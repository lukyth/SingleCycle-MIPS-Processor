`timescale 1ns / 1ps

`include "adder.v"
`include "alu.v"
`include "controller.v"
`include "data_memory.v"
`include "inst_rom.v"
`include "mux.v"
`include "register.v"
`include "signextender.v"

module processor(
  input clock,
  input reset,
  input [7:0] serial_in,
  input serial_valid_in,
  input serial_ready_in,
  output serial_rden_out,
  output [7:0] serial_out,
  output serial_wren_out
);

  reg [31:0] pc = 32'h003FFFFC;
  wire [31:0] pc_plus4;

  adder pc_adder (.in(pc), .out(pc_plus4));

  always @(posedge clock) begin
    if (reset) begin
      pc <= 32'h003ffffc;
    end
    else begin
      pc <= pc_plus4;
    end
  end


endmodule
