`timescale 1ns / 1ps
`default_nettype none
/* This module describes a 2:4 decoder using behavioral constructs in Verilog HDL   /*

/* module interface for the 2:4 decoder*/
module two_four_decoder (
    input wire [1:0] W, 
    input wire En,      
    output reg [3:0] Y 
);
    always@(W or En)    //trigger when W or En changes
        begin   //not necessary because if is single clause but looks better
            if(En == 1'b1)
                case(W) //selection based on W
                    2'b00: Y = 4'b0001;     //4'b signifies a 4-bit binary value
                    2'b01: Y = 4'b0010;
                    2'b10: Y = 4'b0100;
                    2'b11: Y = 4'b1000;
                endcase    //designates the end of a case statement
            else    //if not Enable
                Y = 4'b0000;    //disable all outputs
    end

endmodule
