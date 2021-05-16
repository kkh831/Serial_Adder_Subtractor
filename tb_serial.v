// Made by jwk and ysk @  17.05.13
// modifyed bt shkim @ 19.04.21

`timescale 1ns / 1ps 

module tb_serial();
    parameter   half_clock = 0.5;
    parameter   BIT_WIDTH  = 8;
    parameter   numiter = 1000; 
    reg         [BIT_WIDTH-1:0]     A, B;
    wire        [BIT_WIDTH:0]       result_out;
    reg         [BIT_WIDTH:0]       result_ref;
    reg                             start, clock, resetn;
    // M == 0; adder , M == 1 subtractor
    reg         M;
    initial     M = 0;


    integer     counter, pass, error;
    
    initial     pass= 0;
    initial     error= 0;
    initial begin
        clock = 0;
        forever begin
            #(half_clock) clock = !clock;
        end
    end
    
    initial counter = 0;
    initial start = 0;
    
    // negative reset control 
    initial begin
        resetn = 0;
        #(10*half_clock) resetn = 0;
        #(10*half_clock) resetn = 1;
    end
    
    always @ (posedge clock or negedge resetn) begin
        if (!resetn)             counter = 0;
        else if (counter == 10) counter = 0;
        else                        counter = counter + 1;
    end
    
    always @ (counter) begin
        if (counter == 1) begin
            A <= $random() % 256;  
            B <= $random() % 256;
            start <= 1;
        end
        else begin
            start <= 0;
        end
        if (counter == 0) begin 
            #(half_clock)
            if(result_ref == result_out)
                pass <= pass + 1;
            if(result_ref != result_out)
                error <= error + 1;
        end
    end
    
    always @ (*) begin
        if  (M == 1'b0) begin 
            result_ref = #(20*half_clock)A + B;
        end
        else begin
            result_ref = #(20*half_clock)A - B;
        end
    end 
    
    initial begin
        if  (M == 1'b0) begin 
            $display("Serial Adder mode, M = 0");
        end
        else begin
            $display("Serial Subtractor mode, M = 1");
        end
        #(2*11*(numiter+1)*half_clock);
        $display("Total error count is %d", error);
        $display("Total  pass count is %d\n", pass);
        $finish;
    end
    
    serial_top #   (
        .BIT_WIDTH (BIT_WIDTH) 
    ) uut          (
        .A         (A), 
        .B         (B),
        .M         (M),
        .clock     (clock),
        .start     (start),
        .resetn    (resetn),
        .sum       (result_out)
    );
    initial begin 
        $recordfile("tb_serial.trn");
        $recordvars();  
    end
endmodule

