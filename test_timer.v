`default_nettype	none

module	test_timer (

	// CLK RST
	input	wire			CLK,
	input	wire			RST,

	// Matching signals
	input	wire	[4:0]	MATCH_IN,
	output	wire			MATCH_OUT
);

// Wires
wire	[4:0]	CNT_D;
wire	[4:0]	CNT_Q;

// Assigns
assign	CNT_D = CNT_Q + 5'd1;
assign	MATCH_OUT = (MATCH_IN == CNT_Q);

// Register
PipeReg	#(5)	CNT_FF	(
	.CLK	(CLK),
	.RST	(RST),
	.EN		(1'b1),
	.D		(CNT_D),
	.Q		(CNT_Q)
);

endmodule
