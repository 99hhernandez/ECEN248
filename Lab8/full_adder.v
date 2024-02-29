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
    
    assign #6 S = A ^ B ^ Cin;                     //the hat (^) is for XOR
    assign #4 andAB = A & B;                       //the ampersand (&) is for AND
    assign #4 andBCin = B & Cin;
    assign #4 andACin = A & Cin;
    assign #6 Cout = andAB | andBCin | andACin;    //the pipe (|) is for OR
    
endmodule
