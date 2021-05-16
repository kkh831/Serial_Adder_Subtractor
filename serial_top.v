// Serial adder/subtractor structure.
`default_nettype none
module serial_top #(
    parameter BIT_WIDTH = 8
)(
    input wire [BIT_WIDTH-1:0] A,
    input wire [BIT_WIDTH-1:0] B,
    input wire                 M,
    input wire                 clock,
    input wire                 start,
    input wire                 resetn,
    output wire [BIT_WIDTH:0]  sum
);
    // TYPE YOUR CODE FROM HERE.
    // internal signals
    wire [BIT_WIDTH-1:0] A_reg, B_reg;
    reg cin;

    wire reset, enable, load;
    wire bit_sum, bit_carry;
    FSM my_control(
        .start    (), 
        .clock    (), 
        .resetn   (),
        .reset    (),
        .enable   (),
        .load     ()
    );
    shift_reg #   ( 
        .BIT_WIDTH(BIT_WIDTH)
    ) reg_A       (
        .clock    (), 
        .reset    (1'b0), 
        .bit_in   (1'b0), 
        .enable   (), 
        .load     (),
        .data     (),
        .q        ()
    );
    shift_reg #   ( 
        .BIT_WIDTH(BIT_WIDTH)
    ) reg_B       (
        .clock    (), 
        .reset    (1'b0), 
        .bit_in   (1'b0), 
        .enable   (), 
        .load     (),
        .data     (),
        .q        ()
    );
   
    // full adder
    assign {bit_carry, bit_sum} = A_reg[0] + B_reg[0] + cin;

    always @ (posedge clock) begin
        if (enable) begin
            if (reset) cin <= ;
            else       cin <= ;
        end
    end

    shift_reg #( 
        .BIT_WIDTH(BIT_WIDTH+1)
    ) reg_sum(
        .clock(), 
        .reset(), 
        .bit_in(), 
        .enable(), 
        .load(1'b0),
        .data({BIT_WIDTH+1{1'b0}}),
        .q()
    );
    
endmodule

