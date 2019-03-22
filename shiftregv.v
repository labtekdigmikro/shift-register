module shiftregv(clkin, button, running);

input clkin;
input button;
output reg [9:0] running;

wire buttonCond;
reg [9:0] temp = 10'b0000000001;

integer counter = 0;

assign buttonCond = button;

always@(posedge clkin) begin
	counter <= counter + 1;
	if(counter >= 5000000) begin
		counter <= 0;
		if(buttonCond == 1)begin
			temp <= (temp << 1) | 10'b0000000001;
		end 

		else if(buttonCond == 0) begin
			temp <= (temp << 1);
		end
		running <= temp;
	end

end

endmodule
