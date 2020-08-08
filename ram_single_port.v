`timescale 1ns / 1ps

module ram_single_port(
    input clk,cs,we,
    input [7:0] datain,
    output [7:0] dataout,
    input [5:0] addr
    );
//    memory creating with depth 64
reg [7:0]mem[63:0];

always@(posedge clk)
begin
    if(cs&&we)
        mem[addr]<=datain;
end

reg [7:0]temp;
always@(posedge clk)
begin
    if(cs&&!we)
        temp<=mem[addr];
end

assign dataout=temp;


endmodule
