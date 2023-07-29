module timer_counter_inp
#(parameter N = 4)
(
input clk, reset_n,
input enable,
input [N-1:0] final_value,
output done
);
reg [N-1:0]Q_reg, Q_next;       

always @(posedge clk, negedge reset_n)
begin
     if (!reset_n)
     Q_reg <= 'b0;
     else if (enable)
     Q_reg <= Q_next;
     else
     Q_reg <= Q_reg;
end

assign done = Q_reg == final_value;
always @(*)
begin
    Q_next = done? 'b0 : Q_reg +1;   
end
  
endmodule
