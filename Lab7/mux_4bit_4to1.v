`timescale 1ns / 1ps
`default_nettype none
/* This module describes a 4-bit 4:1 multiplexer using behavioral constructs    *
*  in Verilog HDL                                                               */

module mux_4bit_4to1(Y, A, B, C, D, S);
    //declare output and input ports
    output reg [3:0] Y; //output is a 4-bit wide reg
    input wire [3:0] A, B, C, D; //4-bit wide input wires
    input wire [1:0] S;   //select is a 2-bit wire
    
    always@(*)  //* means triggers when anything changes
                //we did not use begin and end because the case
                //statement is considered one clause
        case(S) //select based on S
            2'b00: Y = A;   //when S == 2'b00
            2'b01: Y = B;   //when S == 2b'01
            2'b10: Y = C;   //when S == 2'b10
            2'b11: Y = D;   //when S == 2'b11
        endcase     //desginates the end of a case statement
        
endmodule
