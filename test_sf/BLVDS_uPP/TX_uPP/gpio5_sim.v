module gpio5_sim
#(
	 HIGH_LENGTH = 9'd200,
	 LOW_LENGTH  = 9'd200
)
(
input       iclk,
input       ibutton,
output reg  o_start_str
);

reg   [8:0] rCNT_H,rCNT_L;
// Initial
initial begin
	o_start_str = 1'b1;
end
// Main
always @(posedge iclk) begin
	if(ibutton) begin
	    rCNT_L <= 0;
	    if (rCNT_H < HIGH_LENGTH) begin
		     rCNT_H <= rCNT_H + 9'd1;
		 end
		 else begin
		     rCNT_H <= 0;
			  o_start_str = 1'b0;
		 end
	end
	else begin
	    rCNT_H <= 0;
	    if (rCNT_L < LOW_LENGTH) begin
		     rCNT_L <= rCNT_L + 9'd1;
		 end
		 else begin
		     rCNT_L <= 0;
			  o_start_str = 1'b1;
		 end
	end
end
endmodule 
