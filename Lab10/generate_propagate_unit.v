`timescale 1ns / 1ps
`default_nettype none
/* This modules describes the Carry Generate/Propagate *
*  Unit for 4-bit carry-lookahead addition             */

module generate_propagate_unit(G,P,X,Y);
    // ports are wires as we will use dataflow
    output wire [15:0] G,P;
    input wire [15:0] X,Y;
    // gi = xiyi
    // pi = xi ^ yi
    assign #2 G = X & Y;

    assign #2 P = X ^ Y;
    
endmodule