`timescale 1ns / 1ps

module tb();
reg clk,cs,we;
reg [5:0]addr;
reg [7:0]datain;
wire [7:0]dataout;

ram_single_port r1(clk,cs,we,datain,dataout,addr);

always #5 clk=~clk;
integer i=0;

initial begin
clk=0;
cs=0;
we=0;
addr=0;
datain=0;
#20 cs=1'b1;

for(i=0;i<6;i=i+1) begin
@(posedge clk)
  write();
end

for(i=0;i<6;i=i+1) begin
@(posedge clk)
  read();
end

#300 $stop;
end

task write;
begin
    we=1'b1;
    addr=addr+1;
    datain= $random;
end
endtask

task read;
begin
    we=1'b0;
    addr=addr-1;
 end
 endtask



    

endmodule
