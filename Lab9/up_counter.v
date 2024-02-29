`timescale 1ns / 1ps
`default_nettype none

/* This module describes a simple 3-bit up-counter using  *
*  half-adder modules built in the previous lab step      */

module up_counter(Count,Carry2,En,Clk,Rst);
    // count output needs to be a reg
    output reg [2:0] Count;
    output wire Carry2;
    // inputs are wires
    input wire En,Clk,Rst;
    
    // intermediate nets
    wire [2:0] Carry,Sum;
    
    // create and instantiate a wrapper for the 3-bit counter
    Threebit_counter UC1(Sum,Carry2,Count,En);
    
    // describe positive edge triggered flip-flop for count
    // including "posedge Rst" in the sensitivity list implies an asynchronous reset
    always@(posedge Clk or posedge Rst)
        if(Rst)     // if Rst == 1'b1
            Count <= 0; //reset count
        else        // otherwise latch sum
            Count <= Sum;
endmodule

module Threebit_counter(Sum,Carry2,Count,En);
    // first we declare the variables 
    input En;
    input [2:0]Count;
    output [2:0]Sum;
    output Carry2;
    wire [2:0] Carry;
    
    // instantiate and wire up half-adder
    half_adder add0(Sum[0],Carry[0],Count[0],En);
    half_adder add1(Sum[1],Carry[1],Count[1],Carry[0]);
    half_adder add2(Sum[2],Carry[2],Count[2],Carry[1]);
    
    // wire up Carry2
    assign Carry2 = Carry[2];
endmodule