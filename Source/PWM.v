module PWM
#(parameter R = 8 , Timer = 16)
(input clk ,reset_n,
input [Timer - 1:0] Final_Value,
input [R:0] duty,
output pwm_out
    );
reg [R-1:0] Q_reg, Q_next;
reg [R-1:0] D_reg, D_next;
wire tick;
always @(posedge clk, negedge reset_n) 
    begin
        if(!reset_n)
        begin
        Q_reg <= 'b0;
        D_reg <= 1'b0;
        end
        else if(tick)
        begin
        Q_reg <= Q_next;
        D_reg <= D_next;
        end
        else
        begin
        Q_reg <= Q_reg;
        D_reg <= D_reg;
        end
    end   
    
always@(*)
    begin
        Q_next = Q_reg +1;
        D_next = (Q_reg < duty);
    end    
    
assign pwm_out = D_reg;

timer_counter_inp #(.N(Timer)) timer (
        .clk(clk),
        .reset_n(reset_n),
        .enable(1'b1),
        .final_value(Final_Value),
        .done(tick)
);
endmodule
