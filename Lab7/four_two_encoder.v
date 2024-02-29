`timescale 1ns / 1ps
`default_nettype none
/* This module describes a 4:2 encoder using behavioral constructs in Verilog HDL */

/*module interface for the 4:2 encoder*/
module four_two_encoder(
    input wire [3:0] W,
    output reg [0:1] Y,
    output wire zero
);
    assign zero = (W == 4'b0000);
    
    //behavioral portion
    always@(W)  //trigger when W changes
        begin   //not necessary because case is single clause but looks better
            case(W) //selection based on W
                4'b0001: Y = 2'b00; //2'b signifies a 2-bit binary value
                4'b0010: Y = 2'b01; //W[1] is lit up
                4'b0100: Y = 2'b10; //W[2] is lit up
                4'b1000: Y = 2'b11; //W[3] is lit up
                default: Y = 2'bXX; //default covers cases not listed
                                    //2'bXX means 2-bits of don't cares
            endcase //declares the end of a case statement
    end         
    
endmodule
