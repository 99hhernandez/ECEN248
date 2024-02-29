`timescale 1ns / 1ps
`default_nettype none
/* This module describes the 4-bit summation unit *
*  for a carry-lookahead adder                    */

module summation_unit(S,P,C);
    // ports are wires because we will use dataflow
    output wire [15:0] S;    //sum vector
    input wire [15:0] P,C;   //propagate and carry vectors
    
    assign #2 S = P ^ C;

endmodule