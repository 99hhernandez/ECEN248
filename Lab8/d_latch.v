`timescale 1ns / 1ps
`default_nettype none

module d_latch(Q,notQ,En,D);
    //declare all ports
    output wire Q,notQ;
    input wire D,En;
    //intermediate nets
    wire notD,nandDEN,nandNOTDEN;   //notD is the output of the inverse of D
                                    //nandDEN is the output of NAND(D,EN)
                                    //nandNOTDEN is the output of NAND(~D,EN)
    //delay for NAND and NOT is 2ns
    assign #2 notD = ~D;
    assign #2 nandDEN = ~(D & En);
    assign #2 nandNOTDEN = ~(notD & En);
    
    nand #2 nand0(Q,nandDEN,notQ);
    nand #2 nand1(notQ,nandNOTDEN,Q);
endmodule