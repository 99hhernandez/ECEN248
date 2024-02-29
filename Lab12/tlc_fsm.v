module tlc_fsm(
    output reg [2:0] state,     //output for debugging
    output reg  RstCount,       //use an always block
    //another always block for these as well
    output reg [1:0] highwaySignal, farmSignal,
    input wire [30:0] Count,
    input wire Clk, Rst,         //clock and reset
    input wire farmSensor      //car sensor
);

    // parameters make the code more readable
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101,
              S6 = 3'b110,
              G = 2'b11,
              R = 2'b01,
              Y = 2'b10;
    
    // intermediate nets
    reg [2:0] nextState;
    
    // describe the next state logic
    always@(*)          //combinational
        case(state)
            S0: begin
                if(Count == 31'b1011001011010000010111100000000 && farmSensor == 1) begin       //Highway green until 30s and sensor
                    nextState = S1;
                    highwaySignal = Y;
                    farmSignal = R;
                    RstCount = 1;
                    end
                else begin
                    nextState = S0;
                    highwaySignal = G;
                    farmSignal = R;
                    RstCount = 0;
                    end
                end
            S1: begin
                if(Count == 31'b001000111100001101000110000000) begin                           //Highway transition to yellow
                    nextState = S2;
                    highwaySignal = R;
                    farmSignal = R;
                    RstCount = 1;
                    end
                else begin
                    nextState = S1;
                    highwaySignal = Y;
                    farmSignal = R;
                    RstCount = 0;
                    end
                end
            S2: begin
                if(Count == 31'b0000010111110101111000010000000) begin                          //Highway and farm red
                    nextState = S3;
                    highwaySignal = R;
                    farmSignal = G;
                    RstCount = 1;
                    end
                else begin
                    nextState = S2;
                    highwaySignal = R;
                    farmSignal = R;
                    RstCount = 0;
                    end
                end
            S3: begin
                if(Count == 31'b001000111100001101000110000000 && farmSensor == 0) begin        //Farm green for 3s and no sensor
                    nextState = S4;
                    highwaySignal = R;
                    farmSignal = Y;
                    RstCount = 1;
                    end
                else if (Count == 31'b001000111100001101000110000000 && farmSensor == 1) begin  //Farm green for 3s and sensor
                    nextState = S5;
                    highwaySignal = R;
                    farmSignal = G;
                    RstCount = 1;
                    end
                end
            S4: begin
                if(Count == 31'b001000111100001101000110000000) begin                           //Farm transition to yellow
                    nextState = S6;
                    highwaySignal = R;
                    farmSignal = R;
                    RstCount = 1;
                    end
                else begin
                    nextState = S4;
                    highwaySignal = R;
                    farmSignal = Y;
                    RstCount = 0;
                    end
                end
            S5: begin
                if(Count == 31'b0101100101101000001011110000000) begin                          //Farm green for 15s after 3s and sensor
                    nextState = S4;
                    highwaySignal = R;
                    farmSignal = Y;
                    RstCount = 1;
                    end
                else begin
                    nextState = S5;
                    highwaySignal = R;
                    farmSignal = G;
                    RstCount = 0;
                    end
                end
            S6: begin
                if (Count == 31'b0000010111110101111000010000000) begin                         //Highway and farm red
                    nextState = S0;
                    highwaySignal = G;
                    farmSignal = R;
                    RstCount = 1;
                    end
                else begin
                    nextState = S6;
                    highwaySignal = R;
                    farmSignal = R;
                    RstCount = 0;
                    end
                end
        endcase
    
    // describe the synchronous logic to hold out state
    always@(posedge Clk)
        if(Rst)
            state <= S0;
        else
            state <= nextState;
        
endmodule

