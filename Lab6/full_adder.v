`timescale 1ns / 1ps
`default_nettype none
/* This module describes the gate-level model of    *
*  a full-adder in Verilog                          */

module full_adder(S,Cout,A,B,Cin);
    
    //declare output and input ports; all 1-bit wires
    output wire S,Cout;
    input wire A,B,Cin;
    
    //declare internal nets; all 1-bit wires
    wire andAB;
    wire andBCin;
    wire andACin;
    
    assign S = A ^ B ^ Cin;                     //the hat (^) is for XOR
    assign andAB = A & B;                       //the ampersand (&) is for AND
    assign andBCin = B & Cin;
    assign andACin = A & Cin;
    assign Cout = andAB | andBCin | andACin;    //the pipe (|) is for OR
    
    
endmodule
