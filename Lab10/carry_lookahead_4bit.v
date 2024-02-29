`timescale 1ns / 1ps
`default_nettype none
/* This is the top-level module for a 4-bit *
*  carry-lookahead adder                    */

module carry_lookahead_4bit(Cout,S,X,Y,Cin);
    // ports are wires as we will use structural 
    output wire Cout;       //C_4 for a 4-bit adder
    output wire [3:0] S;    //final 4-bit sum vector
    input wire [3:0] X,Y;   //4-bit addends
    input wire Cin;         //input carry
    
    // internal nets
    wire [3:0] G,P;
    wire [4:1] C;
    
    // instantiate generate/propagate unit
    generate_propagate_unit GPU0(G,P,X,Y);
    
    // instantiate carry-lookahead unit
    carry_lookahead_unit CLU0(C,G,P,Cin);
    
    // instantiate summation unit
    summation_unit SU0(S,P,{C[3:1],Cin});

    assign Cout = C[4];
endmodule