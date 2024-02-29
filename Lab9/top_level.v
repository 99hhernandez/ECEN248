`timescale 1ns / 1ps
`default_nettype none
/* This is the top-level module which wires all of  *
*  our synchronous components together. This module *
*  does not include synchronizers for the inputs   */

module top_level(LEDs,SWs,BTNs,FastClk);
    // all ports are wires because we will use structural
    // Verilog to wire everything up
    output wire [3:0] LEDs;
    input wire [1:0] SWs,BTNs;
    input wire FastClk;
    // intermediate nets
    wire [3:0] Clocks;
    reg SlowClk;    //will use an always block for max
    
    // behavioral description of a mux which selects 
    // between the four available clock signals
    always@(*)  //combinatorial logic
        case(SWs)   //SWs is a 2-bit bus
            2'b00: SlowClk = Clocks[0];  //use blocking statement for combinational logic
            2'b01: SlowClk = Clocks[1];
            2'b10: SlowClk = Clocks[2];
            2'b11: SlowClk = Clocks[3];
        endcase
    
    // instantiate up-counter
    up_counter UC0(LEDs[2:0],LEDs[3],BTNs[0],SlowClk,BTNs[1]);
    
    // instantiate the clock divider
    clock_divider clk_div0(
        .ClkOut(Clocks),
        .ClkIn(FastClk)
    );
endmodule