
module addr_tiqu(
  input clk128,
  input ff_rx_dval,
  input [31:0 ] ff_rx_data,
  output reg [47:0] addr_scr,
  output reg [47:0] addr_des,
  output reg addr_rdy);//if addr_rdy = 1, tiqu succeed!

always @(posedge ff_rx_dval)
begin
	addr_rdy <= 1'b0;
	addr_des <= 48'b0;
	addr_scr <= 48'b0;
	#1;
	addr_des[47:40] <= {ff_rx_data[27:24], ff_rx_data[31:28]};
	addr_des[39:32] <= {ff_rx_data[19:16], ff_rx_data[23:20]};
	addr_des[31:24] <= {ff_rx_data[11:8 ], ff_rx_data[15:12]};
	addr_des[23:16] <= {ff_rx_data[3 :0 ], ff_rx_data[7 :4 ]};

	
	
	
	@(posedge clk128)
		#1;
		//addr_des[15:0 ] <= ff_rx_data[31:16];
		addr_des[15:8 ] <= {ff_rx_data[27:24], ff_rx_data[31:28]};
		addr_des[7 :0 ] <= {ff_rx_data[19:16], ff_rx_data[23:20]};
		//addr_scr[47:32] <= ff_rx_data[15:0 ];
		addr_scr[47:40] <= {ff_rx_data[11:8 ], ff_rx_data[15:12]};
		addr_scr[39:32] <= {ff_rx_data[3 :0 ], ff_rx_data[7 :4 ]};
	@(posedge clk128)
		#1;
		//addr_scr[31:0 ] <= ff_rx_data;
		addr_scr[31:24] <= {ff_rx_data[27:24], ff_rx_data[31:28]};
		addr_scr[23:16] <= {ff_rx_data[19:16], ff_rx_data[23:20]};
		addr_scr[15:8 ] <= {ff_rx_data[11:8 ], ff_rx_data[15:12]};
		addr_scr[7 :0 ] <= {ff_rx_data[3 :0 ], ff_rx_data[7 :4 ]};
		addr_rdy <= 1'b1;
end
initial
begin
	addr_des = 48'b0;
	addr_scr = 48'b0;
	addr_rdy = 1'b0;	
end

endmodule
/*diao yong
addr_tiqu addr_tiqu_mac1
(
  //input
  .clk128(clk128),
  .ff_rx_dval(ff_rx_dval_mac),//1
  .ff_rx_data(ff_rx_data_mac),//32
  //output
  .addr_scr(addr_scr),//48
  .addr_des(addr_des),//48
  .addr_rdy(addr_rdy));//if addr_rdy = 1, tiqu succeed!
  */