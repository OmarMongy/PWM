module PWM_tb();
parameter R = 8,Timer = 16;
reg clk, reset_n;
reg [Timer - 1:0]Final_Value;
reg [R:0] duty;
wire pwm_out;

PWM #(.R(R), .Timer(Timer)) uut(
        .clk(clk),
        .reset_n(reset_n),
        .Final_Value(Final_Value),
        .duty(duty),
        .pwm_out(pwm_out)
);

localparam T = 20;
always
begin
    clk = 1'b0;
    #(T/2)
    clk = 1'b1;
    #(T/2);
end

initial 
begin
       reset_n = 1'b0;
       #2  
       reset_n = 1'b1;
       duty = 0.25 * (2**R);
       Final_Value = 8'd200;
       
       repeat(2 * 2**R * Final_Value) @(negedge clk);
       duty = 0.50 * (2**R);

       repeat(2 * 2**R * Final_Value) @(negedge clk);
       duty = 0.75 * (2**R);
       #(7 * 2**R * T * 200) $stop;
end
endmodule
