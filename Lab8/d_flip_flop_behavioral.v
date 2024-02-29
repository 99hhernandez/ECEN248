`timescale 1ns / 1ps
`default_nettype none

module d_flip_flop_behavioral(
    output reg Q,   //described in behavioral statement
    output wire notQ,   //described in a dataflow statement
    input wire D,
    input wire Clk  //clock signal
);
    //describe behavior of D flip_flop
    always@(posedge Clk)    //posedge means positive (rising) edge
                            //trigger when rising edge of Clk
        Q<=D;   //non-blocking assignment statement
    assign notQ = ~Q;
endmodule