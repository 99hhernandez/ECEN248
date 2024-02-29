`timescale 1ns / 1ps
`default_nettype none
/*  This module describes a 2-bit ripple-carry adder  */

module adder_2bit(Carry, Sum, A, B); 
    //declare output and input ports
    output wire [1:0] Sum;  //Sum is a 2-bit wide output
    output wire Carry;  //Carry is 1-bit wide
    input wire [1:0] A, B;  //A and B are both 2-bit wide inputs
    
    //declare internal nets
    wire Cout;  //the first carry out in the internal net
    
    full_adder adder0(Sum[0],Cout,A[0],B[0],0);
    full_adder adder1(Sum[1],Carry,A[1],B[1],Cout);
    
endmodule
