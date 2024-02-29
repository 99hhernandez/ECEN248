`timescale 1ns / 1ps
`default_nettype none

module d_latch_behavioral(
    //declare all ports
    output reg Q,   //described in behavioral statement
    output wire notQ,   //described in a dataflow statement
    input wire D, En    //wires can drive regs
);
    //describe behavior of D-latch
    always@(En or D)
        if(En)  //if En != 1'b0
            Q=D;
        //else Q=Q
    assign notQ = ~Q;   //regs can drive wires
endmodule