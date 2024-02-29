`default_nettype none
/* This module describes the top level traffic light *
*  controller module discussed in lab11              */
  
module tlc_controller_ver1(
    output wire [1:0] highwaySignal, farmSignal,        //connected to LEDs
    // Let's output state for debugging
    output wire [3:0] JB,
    input wire Clk,
    // the buttons provide input to our top-level circuit
    input wire Rst,                                      //use as reset
    input wire farmSensor
);
    // intermediate nets
    wire RstSync;
    wire RstCount;
    reg [30:0] Count;
    
    assign JB[3] = RstCount;
    
    // synchronize button inputs
    synchronizer syncRst(RstSync, Rst, Clk);
    
    // instantiate FSM
    tlc_fsm FSM(
        .state(JB[2:0]),        //wire state up to JB
        .RstCount(RstCount),
        .highwaySignal(highwaySignal),
        .farmSignal(farmSignal),
        .Count(Count),
        .Clk(Clk),
        .Rst(RstSync),
        .farmSensor(farmSensor)
);

    //describe Counter with a synchronous reset
    always@(posedge Clk)
        if(RstCount)
            Count = 0;
        else 
            Count = Count + 1;
    
endmodule
