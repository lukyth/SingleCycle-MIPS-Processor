module mux (
  input select,
  input [31:0] in_0,
  input [31:0] in_1,
  output [31:0] out
);

  assign out = (select) ? in_1 : in_0;

endmodule

