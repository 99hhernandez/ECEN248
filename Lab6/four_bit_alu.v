`timescale 1ns / 1ps
`default_nettype none

module four_bit_alu(Result,Overflow,opA,opB,ctrl);
    
    output wire [3:0] Result;   //4-bit output
    output wire Overflow;       //1-bit signal for overflow
    input wire [3:0] opA, opB;  //4-bit operands
    input wire [1:0] ctrl;      //2-bit operation select
    /*  ctrl | operation *
    *    00  |    AND    *
    *    01  |    ADD    *
    *    10  |    AND    *
    *    11  |    SUB    */
    
    //declare internal nets
    wire c0, c1, c2, c3;
    wire [3:0]notB, andAB, sum;
    wire sumOverflow;
    
    //create conjunction logic
    assign andAB[0] = opA[0] & opB[0];
    assign andAB[1] = opA[1] & opB[1];
    assign andAB[2] = opA[2] & opB[2];
    assign andAB[3] = opA[3] & opB[3];
    
    //create complement logic
    assign notB[0] = opB[0] ^ ctrl[1];
    assign notB[1] = opB[1] ^ ctrl[1];
    assign notB[2] = opB[2] ^ ctrl[1];
    assign notB[3] = opB[3] ^ ctrl[1];
        
    //wire up full adders to create a ripple-carry adder
    full_adder adder0(sum[0],c0,opA[0],notB[0],ctrl[1]);
    full_adder adder1(sum[1],c1,opA[1],notB[1],c0);
    full_adder adder2(sum[2],c2,opA[2],notB[2],c1);
    full_adder adder3(sum[3],c3,opA[3],notB[3],c2);
        
    //instantiate user-defined modules
    two_one_mux MUX0(Result[0],andAB[0],sum[0],ctrl[0]);
    two_one_mux MUX1(Result[1],andAB[1],sum[1],ctrl[0]);
    two_one_mux MUX2(Result[2],andAB[2],sum[2],ctrl[0]);
    two_one_mux MUX3(Result[3],andAB[3],sum[3],ctrl[0]);
   
    //overflow detection logic
    assign sumOverflow = c2 ^ c3;
    
    assign Overflow = sumOverflow & ctrl[0];
    
endmodule
