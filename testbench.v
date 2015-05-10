`timescale 1ns/1ps
`include "processor.v"

module testbench();

reg clock;
reg reset;

wire [7:0] serial_out;
wire serial_wren;

wire [31:0] ret1;
wire [31:0] ret2;
wire [31:0] ret3;
wire [31:0] ret4;
assign ret1 = dut.regis_mod.r[10];
assign ret2 = dut.regis_mod.r[11];
assign ret3 = dut.regis_mod.r[12];
assign ret4 = dut.regis_mod.r[13];


//Generate clock at 100 MHz
initial begin
	$dumpfile("testbench.vcd");
    $dumpvars(0,testbench);
	clock <= 1'b0;
	reset <= 1'b1;
	forever #10 clock <= ~clock;
end


//Drop reset after 200 ns
always begin
	#200 reset <= 1'b0;
end
	
//instantiate the processor  "DUT"
processor dut(
	.clock(clock),
	.reset(reset),
	
	.serial_in(8'b0),
	.serial_valid_in(1'b0), //active-high - we never have anything to read from the serial port
	.serial_ready_in(1'b1), //active-high - we are always ready to print serial data
	.serial_rden_out(), //active-high
	.serial_out(serial_out),
	.serial_wren_out(serial_wren) //active-high
);


//This will print out a message whenever the serial port is written to
always @(posedge clock) begin
	if (reset) begin
	end else begin
		if (serial_wren) begin
				$display("[%0d] Serial: %c",$time,serial_out);
		end
	end
	
end


endmodule
