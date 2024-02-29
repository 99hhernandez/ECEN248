`timescale 1ns / 1ps
`default_nettype none

module d_flip_flop(Q,notQ,Clk,D);
    //declare all ports
    output wire Q,notQ; //output of slave
    input wire Clk,D;
    //intermediate nets
    wire notClk;
    wire notNOTClk;
    wire Qm;    //output of master
    wire notQm; //notQM is used in instantiation
                //but left unconnected
    
    //instantiate NOT gates wtih 2ns delay
    assign #2 notClk = ~Clk;
    assign #2 notNOTClk = ~notClk;
    
    //instantiate the D-latches
    d_latch DLATCH0(Qm,notQm,notClk,D);
    d_latch DLATCH1(Q,notQ,notNOTClk,Qm);

endmodule