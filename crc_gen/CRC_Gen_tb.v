`timescale 1ns / 1ps
module CRC_Gen_tb;
 
reg clk;
reg rst_n;
reg [7:0]data;
reg data_valid; 
 
wire [15:0]crc;
 
initial 
begin
    clk=0;
    rst_n=0;
    data=8'b10110110;data_valid=1;//复位时，将初始数据放入寄存器
    #100 rst_n=1;
   
    #500 rst_n =0;
    data =8'b01001100; data_valid=1;
    #300 rst_n =1;
   
    #500 rst_n =0;
    data =8'b10110011;data_valid=1;
    #300 rst_n =1;
   
    #500 rst_n =0;
    data =8'b01001001; data_valid=1;     
    #300 rst_n =1;
    
    #500 rst_n =0;
    data =8'b10101010;data_valid=1; 
    #300 rst_n =1;
end
 CRC_Gen   U0(
   .clk(clk),
   .rst_n(rst_n),
   .data(data),
   .data_valid(data_valid),
   .crc(crc)
    );
endmodule
