// Finite State Machine(FSM) structure.
//
module FSM(
    input  wire start, 
    input  wire clock, 
    input  wire resetn, 
    output wire reset, 
    output wire enable,
    output wire load
);
    parameter WAIT_STATE = 2'b00, WORK_STATE = 2'b01, END_STATE = 2'b11;

    reg [1:0] current_state, next_state;
    reg [3:0] counter;
    // TYPE YOUR CODE FROM HERE! 
    // FILL IN THE BLANK  
    // next state logic
	always@(*) begin
		case(current_state)
			WAIT_STATE:
				if(start)
					next_state <= ;
				else
					next_state <= ;
			WORK_STATE:
				if(counter == )
					next_state <= END_STATE;
				else
					next_state <= ;
			END_STATE:
				if(~start)
					next_state <= ;
				else
					next_state <= ;
			default: next_state <= 2'bxx;
		endcase
	end

	// state registers and a counter
	always@(posedge clock or negedge resetn) begin
		if(~resetn) begin
			current_state <= WAIT_STATE;
			counter <= ;
		end
		else begin
			current_state <= next_state;
			if(current_state == WAIT_STATE)
				counter <= ;
			else if(current_state == )
				counter <= counter + 1'b1;
		end
	end
	// Outputs
	assign reset = (current_state == WAIT_STATE) & start;
	assign load = ;
	assign enable = ;
endmodule
