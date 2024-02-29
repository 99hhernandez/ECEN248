`timescale 1ns / 1ps    //delay unit is 1ns

module sr_latch(Q, notQ, En, S, R);
    //declare all ports
    output wire Q, notQ;
    input wire En, S, R;
    //intermediate nets
    wire nandSEN, nandREN;  //nandSEN is the output of NAND(S,EN)
                            //nandREN is the output of NAND(R,EN)
    assign nandSEN = ~(S & En);
    assign nandREN = ~(R & En);
    
    nand #2 nand0(Q,nandSEN,notQ);  //delay of nand0 is 2ns
    nand #2 nand1(notQ,nandREN,Q);
endmodule