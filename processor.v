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

  wire [31:0] instruction;
  inst_rom instruction_memory (
    .clock(clock),
    .reset(reset),
    .addr_in(pc),
    .data_out(instruction)
  );

  wire [4:0] write_register;
  mux mux_write_register (
    .in_0(instruction[20:16]),
    .in_1(instruction[15:11]),
    .select(RegDst),
    .out(write_register)
  );

  wire [31:0] read_data_1, read_data_2, write_data;
  register registers (
    .write_register(write_register),
    .write_data(write_data),
    .read_register_1(instruction[25:21]),
    .read_data_1(read_data_1),
    .read_register_2(instruction[20:16]),
    .read_data_2(read_data_2),
    .reg_write(RegWrite),
    .clock(clock)
  );

endmodule
