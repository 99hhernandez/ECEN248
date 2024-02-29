`timescale 1ns / 1ps
`default_nettype none

module adder_synchronous(Carry_reg,Sum_reg,Clk,A,B);
    //outputs are regs in order to be able to hold state
    output reg Carry_reg;
    output reg [1:0] Sum_reg;
    //inputs are still wires
    input wire Clk;
    input wire [1:0] A,B;
    
    //intermediate nets
    reg [1:0] A_reg,B_reg;  //will use these as 2-bit registers
    wire Carry; //need this to connect to the registers described above
    wire [1:0] Sum;
    
    //instantiate 2-bit adder
    adder_2bit adder0(Carry,Sum,A_reg,B_reg);
    
    //this behavioral block describes two 2-bit registers
    always@(posedge Clk)    //the trigger condition is the positive edge of clock
        begin   //will need this because we will put two statements in here
            A_reg <= A; //we use non-block assignment here because we want
            B_reg <= B; //these two statements to happen concurrently
        end
    //describe the registers for the result
    always@(posedge Clk)
        begin
            Carry_reg <= Carry;
            Sum_reg <= Sum;
        end
    
endmodule