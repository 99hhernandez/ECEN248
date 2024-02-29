`timescale 1ns / 1ps
`default_nettype none

module priority_encoder(
    input wire [3:0] W,
    output reg [1:0] Y,
    output wire zero
);
    assign zero = (W == 4'b0000);
    
    always@(W)
        begin
            casex(W)
                4'b0001: Y = 2'b00; //2'b signifies 2-bit binary value
                4'b001X: Y = 2'b01; //w[1] is lit up
                4'b01XX: Y = 2'b10; //w[2] is lit up
                4'b1XXX: Y = 2'b11; //w[3] is lit up
                default: Y = 2'bXX;  //default covers cases not listed
            
            endcase
    end
    
endmodule
