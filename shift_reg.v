// Shift register structure.
module shift_reg #( 
    parameter BIT_WIDTH = 8
)(
    input wire clock, 
    input wire reset, 
    input wire bit_in, 
    input wire enable, 
    input wire load,
    input wire [BIT_WIDTH-1:0] data,
    output reg [BIT_WIDTH-1:0] q
);

    always @ (posedge clock) begin
        if (reset) begin
            q <= {BIT_WIDTH{1'b0}};
        end 
        else if (enable) begin
            if (load) q <= data;
            else begin
                q[BIT_WIDTH-2:0] <= q[BIT_WIDTH-1:1];
                q[BIT_WIDTH-1] <= bit_in;
            end 
        end 
    end  
endmodule



