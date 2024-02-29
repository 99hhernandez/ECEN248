/* This module describes the combination-lock            *
*  FSM discussed in the prelab using behavioral Verilog */

module combination_lock_fsm(
    // for ease of debugging, output state
    output reg [2:0] state,
    output wire [3:0] Lock,     //asserted when locked
    input wire Key1,            //unlock button 0
    input wire Key2,            //unlock button 1
    input wire [3:0] Password,  //indicate number
    input wire Reset,           //reset
    input wire Clk             //clock
);

    // parameters make the code more readable
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b111;
    
    // intermediate nets
    reg [2:0] nextState;
    
    // describes next state logic
    always@(*)      //combinational
        case(state)
            S0: begin
                if(Key1 == 1 && Password == 4'b1101)
                    nextState = S1;
                else
                    nextState = S0;
                end
            S1: begin
                if(Key2 == 1 && Password == 4'b0111)
                    nextState = S2;
                else if (Key2 == 1 && Password != 4'b0111)
                    nextState = S0;
                else 
                    nextState = S1;
                end
            S2: begin
                if(Key1 == 1 && Password == 4'b1001)
                    nextState = S3;
                else if (Key1 == 1 && Password != 4'b1001)
                    nextState = S0;
                else 
                    nextState = S2;
                end
            S3: begin
                if (Key2 == 1 && Password == 4'b1110)
                    nextState = S4;
                else if (Key2 == 1 && Password != 4'b1110)
                    nextState = S0;
                else 
                    nextState = S3;
                end
            S4: begin
                if (Reset)
                    nextState = S0;
                else 
                    nextState = S4;
                end
        endcase
        
    // describe the synchronous logic to hold our state
    always@(posedge Clk)
        if (Reset)
            state <= S0;
        else 
            state <= nextState;
    
    // describe the output logic
    assign Lock = (state == S4) ? 4'b1111 : 4'b0000;
    
endmodule