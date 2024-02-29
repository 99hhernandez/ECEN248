`timescale 1ns / 2ns
`default_nettype none
/* This is a behavioral Verilog description of *
*  a 2-bit saturating counter                  */

module saturating_counter(
    // output and input are wires
    output wire [1:0] Count;    //2-bit output
    input wire Up;              //input bit asserted for up
    input Clk, Rst;             //the usual inputs to a synchronous circuit
);
    // parameters make the code much more readable
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;
    
    // intermediate nets
    reg [1:0] state;        //4 states requires 2-bits
    reg [1:0] nextState;    //will be driven in always state
    
    // describe next state logic
    always@(*)      //purely combinational
        case(state)
            S0: begin
                if(Up)  //count up
                    nextState = S1;
                else    //saturate
                    nextState = S0;
                end
            S1: begin
                if(Up)  //count up
                    nextState = S2;
                else    //saturate
                    nextState = S1;
                end
            S2: begin
                if(Up)  //count up
                    nextState = S3;
                else    //saturate
                    nextState = S2;
                end
            S3: begin
                if(Up)  //saturate
                    nextState = S3;
                else    //count down
                    nextState = S2;
                end
        endcase
    
    // describe the synchronous logic to hold our state
    always@(posedge Clk)
        if(Rst)     //reset state
            state <= S0;
        else
            state <= nextState;
    
    // describe the output logic which in this case happens to just be wires
    assign Count = state;
    
endmodule