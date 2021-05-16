`timescale	1ns/10ps

module	tb_timer ();

// parameters
localparam	CLK_HPER	= 5;
localparam	CLK_PER		= CLK_HPER*2;
localparam	SIM_TIME	= 1000;

// wires
reg		CLK;
reg		RST;

wire	[4:0]	MATCH_IN;
wire		MATCH_OUT;

assign	MATCH_IN = 5'd20;

test_timer	UNIT_UNDER_TEST	(
	.CLK		(CLK),
	.RST		(RST),
	.MATCH_IN	(MATCH_IN),
	.MATCH_OUT	(MATCH_OUT)
);

// Clock generation
initial	CLK	<= 1'b0;
always #(CLK_HPER) CLK	<= ~CLK;

// Reset control
initial begin
	RST	<=	1'b1;
	#(CLK_HPER*5)
	RST <= 1'b0;
end

// Simulation control
initial begin
	#(SIM_TIME)
	$finish();
end
// Dump Process for simvision 
initial begin
	$recordfile("tb_test_timer.trn");
	$recordvars();
end
endmodule


