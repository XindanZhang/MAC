module switch_4(
  input clk128,
  input reset,
//*******mac1
//32_rx  out 7 signals || in 1 signal   ||mac1
//  output ff_rx_rdy1,			    //in-1				||--ff_tx_rdy	/out
  input [31:0 ] ff_rx_data1,		//out-32********	||--ff_tx_data	/in
  input [1 :0 ] ff_rx_mod1,			//out-2				||--ff_tx_mod	/in
  input ff_rx_sop1,					//out-1				||--ff_tx_sop	/in
  input ff_rx_eop1,					//out-1				||--ff_tx_eop	/in
  input ff_rx_dval1,				//out-1				||--ff_tx_wren	/in
  input rx_err1,					//out-6				||--ff_tx_err	/in-1
//32_tx  out 3 signals || in 6 signals	||mac1
//  input ff_tx_rdy1,			    //out-1				||--ff_rx_rdy  	/in
  output reg [31:0 ] ff_tx_data1,	//in-32********		||--ff_rx_data	/out
  output reg [1 :0 ] ff_tx_mod1,	//in-2				||--ff_rx_mod	/out
  output reg ff_tx_sop1,			//in-1				||--ff_rx_sop	/out
  output reg ff_tx_eop1,			//in-1				||--ff_rx_eop	/out
  output reg ff_tx_wren1,			//in-1				||--ff_rx_dval	/out
  output reg ff_tx_err1,			//in-1				||--rx_err		/out-6
//*******mac2
//32_rx  out 7 signals || in 1 signal	||mac2
//  output ff_rx_rdy2,			    //in-1				||--ff_tx_rdy	/out
  input [31:0 ] ff_rx_data2,		//out-32********	||--ff_tx_data	/in
  input [1 :0 ] ff_rx_mod2,			//out-2				||--ff_tx_mod	/in
  input ff_rx_sop2,					//out-1				||--ff_tx_sop	/in
  input ff_rx_eop2,					//out-1				||--ff_tx_eop	/in
  input ff_rx_dval2,				//out-1				||--ff_tx_wren	/in
  input rx_err2,					//out-6				||--ff_tx_err	/in-1
//32_tx  out 3 signals || in 6 signals	||mac2
//  input ff_tx_rdy2,				//out-1				||--ff_rx_rdy  	/in
  output reg [31:0 ] ff_tx_data2,	//in-32********		||--ff_rx_data	/out
  output reg [1 :0 ] ff_tx_mod2,	//in-2				||--ff_rx_mod	/out
  output reg ff_tx_sop2,			//in-1				||--ff_rx_sop	/out
  output reg ff_tx_eop2,			//in-1				||--ff_rx_eop	/out
  output reg ff_tx_wren2,			//in-1				||--ff_rx_dval	/out
  output reg ff_tx_err2,			//in-1				||--rx_err		/out-6
//*******mac3
//32_rx  out 7 signals || in 1 signal	||mac3
//  output ff_rx_rdy3,			    //in-1				||--ff_tx_rdy	/out
  input [31:0 ] ff_rx_data3,		//out-32********	||--ff_tx_data	/in
  input [1 :0 ] ff_rx_mod3,			//out-2				||--ff_tx_mod	/in
  input ff_rx_sop3,					//out-1				||--ff_tx_sop	/in
  input ff_rx_eop3,					//out-1				||--ff_tx_eop	/in
  input ff_rx_dval3,				//out-1				||--ff_tx_wren	/in
  input rx_err3,					//out-6				||--ff_tx_err	/in-1
//32_tx  out 3 signals || in 6 signals	||mac3
//  input ff_tx_rdy3,				//out-1				||--ff_rx_rdy  	/in
  output reg [31:0 ] ff_tx_data3,	//in-32********		||--ff_rx_data	/out
  output reg [1 :0 ] ff_tx_mod3,	//in-2				||--ff_rx_mod	/out
  output reg ff_tx_sop3,			//in-1				||--ff_rx_sop	/out
  output reg ff_tx_eop3,			//in-1				||--ff_rx_eop	/out
  output reg ff_tx_wren3,			//in-1				||--ff_rx_dval	/out
  output reg ff_tx_err3,			//in-1				||--rx_err		/out-6
//*******mac4
//32_rx  out 7 signals || in 1 signal	||mac4
//  output ff_rx_rdy4,			    //in-1				||--ff_tx_rdy	/out
  input [31:0 ] ff_rx_data4,		//out-32********	||--ff_tx_data	/in
  input [1 :0 ] ff_rx_mod4,			//out-2				||--ff_tx_mod	/in
  input ff_rx_sop4,					//out-1				||--ff_tx_sop	/in
  input ff_rx_eop4,					//out-1				||--ff_tx_eop	/in
  input ff_rx_dval4,				//out-1				||--ff_tx_wren	/in
  input rx_err4,					//out-6				||--ff_tx_err	/in-1
//32_tx  out 3 signals || in 6 signals	||mac4
//  input ff_tx_rdy4,				//out-1				||--ff_rx_rdy  	/in
  output reg [31:0 ] ff_tx_data4,	//in-32********		||--ff_rx_data	/out
  output reg [1 :0 ] ff_tx_mod4,	//in-2				||--ff_rx_mod	/out
  output reg ff_tx_sop4,			//in-1				||--ff_rx_sop	/out
  output reg ff_tx_eop4,			//in-1				||--ff_rx_eop	/out
  output reg ff_tx_wren4,			//in-1				||--ff_rx_dval	/out
  output reg ff_tx_err4				//in-1				||--rx_err		/out-6 
);
//********************************//

wire [47:0] addr_scr1;//source mac address
wire [47:0] addr_des1;//destination mac address

wire addr_rdy1;
addr_tiqu addr_tiqu_mac1
(
  //input
  .clk128(clk128),
  .ff_rx_dval(ff_rx_dval1),//1
  .ff_rx_data(ff_rx_data1),//32
  //output
  .addr_scr(addr_scr1),//48
  .addr_des(addr_des1),//48
  .addr_rdy(addr_rdy1));//if addr_rdy = 1, tiqu succeed!

//********************************//

//********************************//

wire [47:0] addr_scr2;//source mac address
wire [47:0] addr_des2;//destination mac address

wire addr_rdy2;
addr_tiqu addr_tiqu_mac2
(
  //input
  .clk128(clk128),
  .ff_rx_dval(ff_rx_dval2),//1
  .ff_rx_data(ff_rx_data2),//32
  //output
  .addr_scr(addr_scr2),//48
  .addr_des(addr_des2),//48
  .addr_rdy(addr_rdy2));//if addr_rdy = 1, tiqu succeed!

//********************************//

//********************************//

wire [47:0] addr_scr3;//source mac address
wire [47:0] addr_des3;//destination mac address

wire addr_rdy3;
addr_tiqu addr_tiqu_mac3
(
  //input
  .clk128(clk128),
  .ff_rx_dval(ff_rx_dval3),//1
  .ff_rx_data(ff_rx_data3),//32
  //output
  .addr_scr(addr_scr3),//48
  .addr_des(addr_des3),//48
  .addr_rdy(addr_rdy3));//if addr_rdy = 1, tiqu succeed!

//********************************//

//********************************//

wire [47:0] addr_scr4;//source mac address
wire [47:0] addr_des4;//destination mac address

wire addr_rdy4;
addr_tiqu addr_tiqu_mac4
(
  //input
  .clk128(clk128),
  .ff_rx_dval(ff_rx_dval4),//1
  .ff_rx_data(ff_rx_data4),//32
  //output
  .addr_scr(addr_scr4),//48
  .addr_des(addr_des4),//48
  .addr_rdy(addr_rdy4));//if addr_rdy = 1, tiqu succeed!

//********************************//

reg [47:0] addr_scr;//source mac address
reg [47:0] addr_des;//destination mac address

reg flag_des_search;


  reg [56:0]	MAC_Table1;//MAC地址表
  reg [56:0]	MAC_Table2;
  reg [56:0]	MAC_Table3;
  reg [56:0]	MAC_Table4;

  reg [3:0]   input_port_reg;   //输入端口号 
  reg [3:0]   output_port_reg;  //输出端口号

  reg [95:0] addr_fz;
  parameter time_decay = 9'd128;

  reg addr_rdy;

always @(posedge addr_rdy or posedge reset)
begin
	if (reset == 1)
		flag_des_search <= 1'b0;
	else
		flag_des_search <= 1'b1;
end

always @(posedge clk128 or posedge reset)//确定输入端口号---可再提前几个时钟
begin

	if (reset == 1)
	begin
		input_port_reg <= 4'b0000;
		output_port_reg <= 4'b0000;
		addr_rdy <= 0;
	end
	else if(addr_rdy1 == 1)
	begin
		input_port_reg <= 4'b0001;
		addr_des <= addr_des1;
		addr_scr <= addr_scr1;		
		addr_rdy <= 0;

	end
	else if(addr_rdy2 == 1)
	begin
		input_port_reg <= 4'b0010;
		addr_des <= addr_des2;
		addr_scr <= addr_scr2;
		addr_rdy <= 0;
	end
	else if(addr_rdy3 == 1)
	begin
		input_port_reg <= 4'b0100;
		addr_des <= addr_des3;
		addr_scr <= addr_scr3;
		addr_rdy <= 0;
	end
	else if(addr_rdy4 == 1)
	begin
		input_port_reg <= 4'b1000;
		addr_des <= addr_des4;
		addr_scr <= addr_scr4;
		addr_rdy <= 0;
	end
	else
	begin
		input_port_reg <= 4'b0000;
		addr_des <= 48'b0;
		addr_scr <= 48'b0;		
		addr_rdy <= 0;
	end
end

////////////////////////////////////////////////////

// buffer mac1
//reg ff_rx_rdy1_buf;				//out-1				||--ff_rx_rdy  	/in
reg [31:0 ] ff_rx_data1_buf;		//in-32********		||--ff_rx_data	/out
reg [1 :0 ] ff_rx_mod1_buf;		//in-2				||--ff_rx_mod	/out
reg ff_rx_sop1_buf;				//in-1				||--ff_rx_sop	/out
reg ff_rx_eop1_buf;				//in-1				||--ff_rx_eop	/out
reg ff_rx_dval1_buf;				//in-1				||--ff_rx_dval	/out
reg rx_err1_buf;					//in-1				||--rx_err		/out-6

//  reg [2:0]ff_rx_rdy_buf1;			//in-1				||--ff_tx_rdy	/out
  reg [95:0 ] ff_rx_data_buf1;		//out-32********	||--ff_tx_data	/in
  reg [5 :0 ] ff_rx_mod_buf1;			//out-2				||--ff_tx_mod	/in
  reg [2:0] ff_rx_sop_buf1;					//out-1				||--ff_tx_sop	/in
  reg [2:0] ff_rx_eop_buf1;					//out-1				||--ff_tx_eop	/in
  reg [2:0] ff_rx_dval_buf1;				//out-1				||--ff_tx_wren	/in
  reg [17:0] rx_err_buf1;					//out-6				||--ff_tx_err	/in-1
  
  reg flag;
 
always @(*)
begin
	if((ff_rx_dval1 | ff_rx_dval2 | ff_rx_dval3 | ff_rx_dval4) == 1)
		flag =1;
end
 


always @(posedge clk128 or posedge reset)
begin
	if (reset == 1)begin
//		ff_rx_rdy_buf1 <= 0;			
		ff_rx_data_buf1 <= 0;	
		ff_rx_mod_buf1 <= 0;	
		ff_rx_sop_buf1 <= 0;			
		ff_rx_eop_buf1 <= 0;			
		ff_rx_dval_buf1 <= 0;			
		rx_err_buf1 <= 0;
		flag <= 0;
	end
	else begin
		if (flag == 1)begin
//			ff_rx_rdy_buf1  <= {ff_rx_rdy1, ff_rx_rdy_buf1[2], ff_rx_rdy_buf1[1]};			
			ff_rx_data_buf1 <= {ff_rx_data1, ff_rx_data_buf1[95:64], ff_rx_data_buf1[63:32]};	
			ff_rx_mod_buf1  <= {ff_rx_mod1, ff_rx_mod_buf1[5:4], ff_rx_mod_buf1[3:2]};	
			ff_rx_sop_buf1  <= {ff_rx_sop1, ff_rx_sop_buf1[2], ff_rx_sop_buf1[1]};			
			ff_rx_eop_buf1  <= {ff_rx_eop1, ff_rx_eop_buf1[2], ff_rx_eop_buf1[1]};			
			ff_rx_dval_buf1 <= {ff_rx_dval1, ff_rx_dval_buf1[2], ff_rx_dval_buf1[1]};			
			rx_err_buf1 	   <= {rx_err1, rx_err_buf1[17:12], rx_err_buf1[11:6]};
		end
		else	begin
//			ff_rx_rdy_buf1 <= ff_rx_rdy_buf1;			
			ff_rx_data_buf1 <= ff_rx_data_buf1;	
			ff_rx_mod_buf1 <= ff_rx_mod_buf1;	
			ff_rx_sop_buf1 <= ff_rx_sop_buf1;			
			ff_rx_eop_buf1 <= ff_rx_eop_buf1;			
			ff_rx_dval_buf1 <= ff_rx_dval_buf1;			
			rx_err_buf1 <= rx_err_buf1;
		end		
	end
end

always @(posedge clk128 or posedge reset)
begin
	if (reset == 1)begin
//		ff_rx_rdy1_buf <= 0;			
		ff_rx_data1_buf <= 32'b0;	
		ff_rx_mod1_buf <= 3'b0;	
		ff_rx_sop1_buf <= 1'b0;			
		ff_rx_eop1_buf <= 1'b0;			
		ff_rx_dval1_buf <= 1'b0;			
		rx_err1_buf <= 1'b0;
	end
	else begin		
//		ff_rx_rdy1_buf <= ff_rx_rdy_buf1[0];			
		ff_rx_data1_buf <= ff_rx_data_buf1[31:0];	
		ff_rx_mod1_buf <= ff_rx_mod_buf1[1:0];	
		ff_rx_sop1_buf <= ff_rx_sop_buf1[0];			
		ff_rx_eop1_buf <= ff_rx_eop_buf1[0];			
		ff_rx_dval1_buf <= ff_rx_dval_buf1[0];			
		rx_err1_buf <= rx_err_buf1[5:0];			
	end
end

// buffer mac2
//reg ff_rx_rdy2_buf;				//out-1				||--ff_rx_rdy  	/in
reg [31:0 ] ff_rx_data2_buf;		//in-32********		||--ff_rx_data	/out
reg [1 :0 ] ff_rx_mod2_buf;		//in-2				||--ff_rx_mod	/out
reg ff_rx_sop2_buf;				//in-1				||--ff_rx_sop	/out
reg ff_rx_eop2_buf;				//in-1				||--ff_rx_eop	/out
reg ff_rx_dval2_buf;				//in-1				||--ff_rx_dval	/out
reg rx_err2_buf;					//in-1				||--rx_err		/out-6

//  reg [2:0]ff_rx_rdy_buf2;			//in-1				||--ff_tx_rdy	/out
  reg [95:0 ] ff_rx_data_buf2;		//out-32********	||--ff_tx_data	/in
  reg [5 :0 ] ff_rx_mod_buf2;			//out-2				||--ff_tx_mod	/in
  reg [2:0] ff_rx_sop_buf2;					//out-1				||--ff_tx_sop	/in
  reg [2:0] ff_rx_eop_buf2;					//out-1				||--ff_tx_eop	/in
  reg [2:0] ff_rx_dval_buf2;				//out-1				||--ff_tx_wren	/in
  reg [17:0] rx_err_buf2;					//out-6				||--ff_tx_err	/in-1
  
//  reg flag;
 
 


always @(posedge clk128 or posedge reset)
begin
	if (reset == 1)begin
//		ff_rx_rdy_buf2 <= 0;			
		ff_rx_data_buf2 <= 0;	
		ff_rx_mod_buf2 <= 0;	
		ff_rx_sop_buf2 <= 0;			
		ff_rx_eop_buf2 <= 0;			
		ff_rx_dval_buf2 <= 0;			
		rx_err_buf2 <= 0;
		flag <= 0;
	end
	else begin
		if (flag == 1)begin
//			ff_rx_rdy_buf2  <= {ff_rx_rdy2, ff_rx_rdy_buf2[2], ff_rx_rdy_buf2[1]};			
			ff_rx_data_buf2 <= {ff_rx_data2, ff_rx_data_buf2[95:64], ff_rx_data_buf2[63:32]};	
			ff_rx_mod_buf2  <= {ff_rx_mod2, ff_rx_mod_buf2[5:4], ff_rx_mod_buf2[3:2]};	
			ff_rx_sop_buf2  <= {ff_rx_sop2, ff_rx_sop_buf2[2], ff_rx_sop_buf2[1]};			
			ff_rx_eop_buf2  <= {ff_rx_eop2, ff_rx_eop_buf2[2], ff_rx_eop_buf2[1]};			
			ff_rx_dval_buf2 <= {ff_rx_dval2, ff_rx_dval_buf2[2], ff_rx_dval_buf2[1]};			
			rx_err_buf2 	   <= {rx_err2, rx_err_buf2[17:12], rx_err_buf2[11:6]};
		end
		else	begin
//			ff_rx_rdy_buf2 <= ff_rx_rdy_buf2;			
			ff_rx_data_buf2 <= ff_rx_data_buf2;	
			ff_rx_mod_buf2 <= ff_rx_mod_buf2;	
			ff_rx_sop_buf2 <= ff_rx_sop_buf2;			
			ff_rx_eop_buf2 <= ff_rx_eop_buf2;			
			ff_rx_dval_buf2 <= ff_rx_dval_buf2;			
			rx_err_buf2 <= rx_err_buf2;
		end		
	end
end

always @(posedge clk128 or posedge reset)
begin
	if (reset == 1)begin
//		ff_rx_rdy2_buf <= 0;			
		ff_rx_data2_buf <= 32'b0;	
		ff_rx_mod2_buf <= 3'b0;	
		ff_rx_sop2_buf <= 1'b0;			
		ff_rx_eop2_buf <= 1'b0;			
		ff_rx_dval2_buf <= 1'b0;			
		rx_err2_buf <= 1'b0;
	end
	else begin		
//		ff_rx_rdy2_buf <= ff_rx_rdy_buf2[0];			
		ff_rx_data2_buf <= ff_rx_data_buf2[31:0];	
		ff_rx_mod2_buf <= ff_rx_mod_buf2[1:0];	
		ff_rx_sop2_buf <= ff_rx_sop_buf2[0];			
		ff_rx_eop2_buf <= ff_rx_eop_buf2[0];			
		ff_rx_dval2_buf <= ff_rx_dval_buf2[0];			
		rx_err2_buf <= rx_err_buf2[5:0];			
	end
end

// buffer mac3
//reg ff_rx_rdy3_buf;				//out-1				||--ff_rx_rdy  	/in
reg [31:0 ] ff_rx_data3_buf;		//in-32********		||--ff_rx_data	/out
reg [1 :0 ] ff_rx_mod3_buf;		//in-2				||--ff_rx_mod	/out
reg ff_rx_sop3_buf;				//in-1				||--ff_rx_sop	/out
reg ff_rx_eop3_buf;				//in-1				||--ff_rx_eop	/out
reg ff_rx_dval3_buf;				//in-1				||--ff_rx_dval	/out
reg rx_err3_buf;					//in-1				||--rx_err		/out-6

//  reg [2:0]ff_rx_rdy_buf3;			//in-1				||--ff_tx_rdy	/out
  reg [95:0 ] ff_rx_data_buf3;		//out-32********	||--ff_tx_data	/in
  reg [5 :0 ] ff_rx_mod_buf3;			//out-2				||--ff_tx_mod	/in
  reg [2:0] ff_rx_sop_buf3;					//out-1				||--ff_tx_sop	/in
  reg [2:0] ff_rx_eop_buf3;					//out-1				||--ff_tx_eop	/in
  reg [2:0] ff_rx_dval_buf3;				//out-1				||--ff_tx_wren	/in
  reg [17:0] rx_err_buf3;					//out-6				||--ff_tx_err	/in-1
  
//  reg flag;
 
 


always @(posedge clk128 or posedge reset)
begin
	if (reset == 1)begin
//		ff_rx_rdy_buf3 <= 0;			
		ff_rx_data_buf3 <= 0;	
		ff_rx_mod_buf3 <= 0;	
		ff_rx_sop_buf3 <= 0;			
		ff_rx_eop_buf3 <= 0;			
		ff_rx_dval_buf3 <= 0;			
		rx_err_buf3 <= 0;
		flag <= 0;
	end
	else begin
		if (flag == 1)begin
//			ff_rx_rdy_buf3  <= {ff_rx_rdy3, ff_rx_rdy_buf3[2], ff_rx_rdy_buf3[1]};			
			ff_rx_data_buf3 <= {ff_rx_data3, ff_rx_data_buf3[95:64], ff_rx_data_buf3[63:32]};	
			ff_rx_mod_buf3  <= {ff_rx_mod3, ff_rx_mod_buf3[5:4], ff_rx_mod_buf3[3:2]};	
			ff_rx_sop_buf3  <= {ff_rx_sop3, ff_rx_sop_buf3[2], ff_rx_sop_buf3[1]};			
			ff_rx_eop_buf3  <= {ff_rx_eop3, ff_rx_eop_buf3[2], ff_rx_eop_buf3[1]};			
			ff_rx_dval_buf3 <= {ff_rx_dval3, ff_rx_dval_buf3[2], ff_rx_dval_buf3[1]};			
			rx_err_buf3 	   <= {rx_err3, rx_err_buf3[17:12], rx_err_buf3[11:6]};
		end
		else	begin
//			ff_rx_rdy_buf3 <= ff_rx_rdy_buf3;			
			ff_rx_data_buf3 <= ff_rx_data_buf3;	
			ff_rx_mod_buf3 <= ff_rx_mod_buf3;	
			ff_rx_sop_buf3 <= ff_rx_sop_buf3;			
			ff_rx_eop_buf3 <= ff_rx_eop_buf3;			
			ff_rx_dval_buf3 <= ff_rx_dval_buf3;			
			rx_err_buf3 <= rx_err_buf3;
		end		
	end
end

always @(posedge clk128 or posedge reset)
begin
	if (reset == 1)begin
//		ff_rx_rdy3_buf <= 0;			
		ff_rx_data3_buf <= 32'b0;	
		ff_rx_mod3_buf <= 3'b0;	
		ff_rx_sop3_buf <= 1'b0;			
		ff_rx_eop3_buf <= 1'b0;			
		ff_rx_dval3_buf <= 1'b0;			
		rx_err3_buf <= 1'b0;
	end
	else begin		
//		ff_rx_rdy3_buf <= ff_rx_rdy_buf3[0];			
		ff_rx_data3_buf <= ff_rx_data_buf3[31:0];	
		ff_rx_mod3_buf <= ff_rx_mod_buf3[1:0];	
		ff_rx_sop3_buf <= ff_rx_sop_buf3[0];			
		ff_rx_eop3_buf <= ff_rx_eop_buf3[0];			
		ff_rx_dval3_buf <= ff_rx_dval_buf3[0];			
		rx_err3_buf <= rx_err_buf3[5:0];			
	end
end

// buffer mac4
//reg ff_rx_rdy4_buf;				//out-1				||--ff_rx_rdy  	/in
reg [31:0 ] ff_rx_data4_buf;		//in-32********		||--ff_rx_data	/out
reg [1 :0 ] ff_rx_mod4_buf;		//in-2				||--ff_rx_mod	/out
reg ff_rx_sop4_buf;				//in-1				||--ff_rx_sop	/out
reg ff_rx_eop4_buf;				//in-1				||--ff_rx_eop	/out
reg ff_rx_dval4_buf;				//in-1				||--ff_rx_dval	/out
reg rx_err4_buf;					//in-1				||--rx_err		/out-6

//  reg [2:0]ff_rx_rdy_buf4;			//in-1				||--ff_tx_rdy	/out
  reg [95:0 ] ff_rx_data_buf4;		//out-32********	||--ff_tx_data	/in
  reg [5 :0 ] ff_rx_mod_buf4;			//out-2				||--ff_tx_mod	/in
  reg [2:0] ff_rx_sop_buf4;					//out-1				||--ff_tx_sop	/in
  reg [2:0] ff_rx_eop_buf4;					//out-1				||--ff_tx_eop	/in
  reg [2:0] ff_rx_dval_buf4;				//out-1				||--ff_tx_wren	/in
  reg [17:0] rx_err_buf4;					//out-6				||--ff_tx_err	/in-1
  
//  reg flag;
 
 


always @(posedge clk128 or posedge reset)
begin
	if (reset == 1)begin
//		ff_rx_rdy_buf4 <= 0;			
		ff_rx_data_buf4 <= 0;	
		ff_rx_mod_buf4 <= 0;	
		ff_rx_sop_buf4 <= 0;			
		ff_rx_eop_buf4 <= 0;			
		ff_rx_dval_buf4 <= 0;			
		rx_err_buf4 <= 0;
		flag <= 0;
	end
	else begin
		if (flag == 1)begin
//			ff_rx_rdy_buf4  <= {ff_rx_rdy4, ff_rx_rdy_buf4[2], ff_rx_rdy_buf4[1]};			
			ff_rx_data_buf4 <= {ff_rx_data4, ff_rx_data_buf4[95:64], ff_rx_data_buf4[63:32]};	
			ff_rx_mod_buf4  <= {ff_rx_mod4, ff_rx_mod_buf4[5:4], ff_rx_mod_buf4[3:2]};	
			ff_rx_sop_buf4  <= {ff_rx_sop4, ff_rx_sop_buf4[2], ff_rx_sop_buf4[1]};			
			ff_rx_eop_buf4  <= {ff_rx_eop4, ff_rx_eop_buf4[2], ff_rx_eop_buf4[1]};			
			ff_rx_dval_buf4 <= {ff_rx_dval4, ff_rx_dval_buf4[2], ff_rx_dval_buf4[1]};			
			rx_err_buf4 	   <= {rx_err4, rx_err_buf4[17:12], rx_err_buf4[11:6]};
		end
		else	begin
//			ff_rx_rdy_buf4 <= ff_rx_rdy_buf4;			
			ff_rx_data_buf4 <= ff_rx_data_buf4;	
			ff_rx_mod_buf4 <= ff_rx_mod_buf4;	
			ff_rx_sop_buf4 <= ff_rx_sop_buf4;			
			ff_rx_eop_buf4 <= ff_rx_eop_buf4;			
			ff_rx_dval_buf4 <= ff_rx_dval_buf4;			
			rx_err_buf4 <= rx_err_buf4;
		end		
	end
end

always @(posedge clk128 or posedge reset)
begin
	if (reset == 1)begin
//		ff_rx_rdy4_buf <= 0;			
		ff_rx_data4_buf <= 32'b0;	
		ff_rx_mod4_buf <= 3'b0;	
		ff_rx_sop4_buf <= 1'b0;			
		ff_rx_eop4_buf <= 1'b0;			
		ff_rx_dval4_buf <= 1'b0;			
		rx_err4_buf <= 1'b0;
	end
	else begin		
//		ff_rx_rdy4_buf <= ff_rx_rdy_buf4[0];			
		ff_rx_data4_buf <= ff_rx_data_buf4[31:0];	
		ff_rx_mod4_buf <= ff_rx_mod_buf4[1:0];	
		ff_rx_sop4_buf <= ff_rx_sop_buf4[0];			
		ff_rx_eop4_buf <= ff_rx_eop_buf4[0];			
		ff_rx_dval4_buf <= ff_rx_dval_buf4[0];			
		rx_err4_buf <= rx_err_buf4[5:0];			
	end
end

////////////////////////////////////////
reg [32:0] counter;
always@(posedge clk128 or posedge reset)
begin
if(reset == 1) 
	begin
	 counter <= 27'b0;
	 MAC_Table1[56:0] <= {48'b0001,time_decay}; 
	 MAC_Table2[56:0] <= {48'b0010,time_decay}; 
	 MAC_Table3[56:0] <= {48'b0100,time_decay}; 
	 MAC_Table4[56:0] <= {48'b1000,time_decay}; 
	end
else begin
	if(counter == 1000)
	begin
	    counter<=27'b0;
    	if(MAC_Table1[8:0]==9'd0) MAC_Table1[56:9] <= 48'd0 ;
		else MAC_Table1[8:0]<=MAC_Table1[8:0]-1;
		if(MAC_Table2[8:0]==9'd0) MAC_Table2[56:9] <= 48'd0 ;
		else MAC_Table2[8:0]<=MAC_Table2[8:0]-1;
		if(MAC_Table3[8:0]==9'd0) MAC_Table3[56:9] <= 48'd0 ;
		else MAC_Table3[8:0]<=MAC_Table3[8:0]-1;
		if(MAC_Table4[8:0]==9'd0) MAC_Table4[56:9] <= 48'd0 ;
		else MAC_Table4[8:0]<=MAC_Table4[8:0]-1;
	end
	else
		counter <= counter+1;	
	end
end

always @(posedge addr_rdy)
begin
	if(addr_rdy == 1)//address tiqu success
	begin
		case(input_port_reg)//根据输入端口号把信息输入到MAC地址表中
		  4'b0001:
			  begin
				if(addr_scr == MAC_Table1[56:9]) 
					MAC_Table1[8:0] <= time_decay;//输入老化时间300s
				else begin
					MAC_Table1[56:9] <= addr_scr;//输入来源地址
					MAC_Table1[8:0] <= time_decay;//输入老化时间300s
				end
			  end
		  4'b0010:
			  begin
				if(addr_scr == MAC_Table2[56:9]) 
					MAC_Table2[8:0] <= time_decay;
				else begin
					MAC_Table2[56:9] <= addr_scr;
					MAC_Table2[8:0] <= time_decay;
				end
			  end
		  4'b0100:
			  begin
				if(addr_scr == MAC_Table3[56:9]) 
					MAC_Table3[8:0] <= time_decay;
				else begin
					MAC_Table3[56:9] <= addr_scr;
					MAC_Table3[8:0] <= time_decay;
				end
			  end
		  4'b1000:
			  begin
				if(addr_scr == MAC_Table4[56:9]) 
					MAC_Table4[8:0] <= time_decay;
				else begin
					MAC_Table4[56:9] <= addr_scr;
					MAC_Table4[8:0] <= time_decay;
				end
			  end
		  default;
		endcase
	end
end

reg en_send;


// find des mac
always@(posedge clk128)
begin
	if(flag_des_search == 1)
	begin
//		@(posedge clk128) begin
			flag_des_search <= 0;
			en_send <= 1;
			if(addr_des == MAC_Table1[56:9]) 
			begin 
				addr_fanzhuan(addr_des, addr_scr, addr_fz);
				output_port_reg <= 4'b0001;
			end
			else if (addr_des == MAC_Table2[56:9])
			begin 
				addr_fanzhuan(addr_des, addr_scr, addr_fz);
				output_port_reg <= 4'b0010;
			end
			else if(addr_des == MAC_Table3[56:9])
			begin 
				addr_fanzhuan(addr_des, addr_scr, addr_fz);
				output_port_reg <= 4'b0100;
			end
			else if(addr_des == MAC_Table4[56:9])
			begin 
				addr_fanzhuan(addr_des, addr_scr, addr_fz);
				output_port_reg <= 4'b1000;
			end
			else 
			begin 
				addr_des <= 48'hffff_ffff_ffff;
				addr_fanzhuan(48'hffff_ffff_ffff, addr_scr, addr_fz);
				output_port_reg <= 4'b1111;
			end//广播
//		end
	end
end


task addr_fanzhuan(     //定义tx_bit任务
	input [47:0] addr_des,    //任务中定义输入端口为8位data数据输入
	input [47:0] addr_scr,    //任务中定义输入端口为8位data数据输入
	output reg [95:0] addr_fz    //任务中定义输入端口为8位data数据输入
);
integer i,j;
begin

	addr_fz[95:88] = {addr_des[43:40], addr_des[47:44]};
	addr_fz[87:80] = {addr_des[35:32], addr_des[39:36]};
	addr_fz[79:72] = {addr_des[27:24], addr_des[31:28]};
	addr_fz[71:64] = {addr_des[19:16], addr_des[23:20]};
	addr_fz[63:56] = {addr_des[11:8 ], addr_des[15:12]};
	addr_fz[55:48] = {addr_des[3 :0 ], addr_des[7 :4 ]};

	addr_fz[47:40] = {addr_scr[43:40], addr_scr[47:44]};
	addr_fz[39:32] = {addr_scr[35:32], addr_scr[39:36]};
	addr_fz[31:24] = {addr_scr[27:24], addr_scr[31:28]};
	addr_fz[23:16] = {addr_scr[19:16], addr_scr[23:20]};
	addr_fz[15:8 ] = {addr_scr[11:8 ], addr_scr[15:12]};
	addr_fz[7 :0 ] = {addr_scr[3 :0 ], addr_scr[7 :4 ]};
	
 	for(i=0; i<6; i=i+1) begin
		addr_fz[95 - i*8-:8] = {addr_des[43 - i*8-:4], addr_des[47 - i*8-:4]};		
	end
	for(j=0; j<6; j=j+1) begin
		addr_fz[47 - j*8-:8] = {addr_scr[43 - i*8-:4], addr_scr[47 - i*8-:4]};		
	end
	
end

endtask

/////////////////////////////////////////////////////////////////

reg [3:0] cnt_addr_send1;
reg [3:0] cnt_addr_send2;
reg [3:0] cnt_addr_send3;
reg [3:0] cnt_addr_send4;


always @(negedge addr_rdy)
begin
	@(posedge clk128)
	en_send <= 0;
end

always @(posedge clk128 or posedge reset)
begin
	if(reset == 1)//address tiqu success
	begin
		output_port_reg <= 4'b0000;
		cnt_addr_send1 <= 0;
		cnt_addr_send2 <= 0;
		cnt_addr_send3 <= 0;
		cnt_addr_send4 <= 0;
		en_send <= 0;
	end
	else if(en_send == 1)
	begin
		case(output_port_reg)//根据输出端口号输出信息
		  4'b0001:					//send to mac1
			  begin
				if(input_port_reg == 4'b0001) 			//mac1 send to mac1
				begin
					send_rx2tx(ff_rx_mod1_buf, ff_rx_sop1_buf, ff_rx_eop1_buf, ff_rx_dval1_buf, rx_err1_buf, ff_tx_mod1, ff_tx_sop1, ff_tx_eop1, ff_tx_wren1, ff_tx_err1);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send1)
						0:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data1);
						end	
						1:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data1);
						end
						2:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data1);
						end
						3:begin
							//cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(ff_rx_data1_buf,ff_tx_data1);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0010)  			//mac2 send to mac1
				begin
					send_rx2tx(ff_rx_mod2_buf, ff_rx_sop2_buf, ff_rx_eop2_buf, ff_rx_dval2_buf, rx_err2_buf, ff_tx_mod1, ff_tx_sop1, ff_tx_eop1, ff_tx_wren1, ff_tx_err1);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send2)
						0:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data1);
						end	
						1:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data1);
						end
						2:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data1);
						end
						3:begin
							//cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(ff_rx_data2_buf,ff_tx_data1);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0100)  			//mac3 send to mac1
				begin
					send_rx2tx(ff_rx_mod3_buf, ff_rx_sop3_buf, ff_rx_eop3_buf, ff_rx_dval3_buf, rx_err3_buf, ff_tx_mod1, ff_tx_sop1, ff_tx_eop1, ff_tx_wren1, ff_tx_err1);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send3)
						0:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data1);
						end	
						1:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data1);
						end
						2:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data1);
						end
						3:begin
							//cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(ff_rx_data3_buf,ff_tx_data1);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b1000)  			//mac4 send to mac1
				begin
					send_rx2tx(ff_rx_mod4_buf, ff_rx_sop4_buf, ff_rx_eop4_buf, ff_rx_dval4_buf, rx_err4_buf, ff_tx_mod1, ff_tx_sop1, ff_tx_eop1, ff_tx_wren1, ff_tx_err1);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send4)
						0:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data1);
						end	
						1:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data1);
						end
						2:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data1);
						end
						3:begin
							//cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(ff_rx_data4_buf,ff_tx_data1);
						end
						default: ;
					endcase
				end
			  end
		  4'b0010:					//send to mac2
			  begin
				if(input_port_reg == 4'b0001) 			//mac1 send to mac2
				begin
					send_rx2tx(ff_rx_mod1_buf, ff_rx_sop1_buf, ff_rx_eop1_buf, ff_rx_dval1_buf, rx_err1_buf, ff_tx_mod2, ff_tx_sop2, ff_tx_eop2, ff_tx_wren2, ff_tx_err2);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send1)
						0:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data2);
						end	
						1:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data2);
						end
						2:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data2);
						end
						3:begin
							//cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(ff_rx_data1_buf,ff_tx_data2);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0010)  			//mac2 send to mac2
				begin
					send_rx2tx(ff_rx_mod2_buf, ff_rx_sop2_buf, ff_rx_eop2_buf, ff_rx_dval2_buf, rx_err2_buf, ff_tx_mod2, ff_tx_sop2, ff_tx_eop2, ff_tx_wren2, ff_tx_err2);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send2)
						0:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data2);
						end	
						1:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data2);
						end
						2:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data2);
						end
						3:begin
							//cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(ff_rx_data2_buf,ff_tx_data2);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0100)  			//mac3 send to mac2
				begin
					send_rx2tx(ff_rx_mod3_buf, ff_rx_sop3_buf, ff_rx_eop3_buf, ff_rx_dval3_buf, rx_err3_buf, ff_tx_mod2, ff_tx_sop2, ff_tx_eop2, ff_tx_wren2, ff_tx_err2);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send3)
						0:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data2);
						end	
						1:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data2);
						end
						2:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data2);
						end
						3:begin
							//cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(ff_rx_data3_buf,ff_tx_data2);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b1000)  			//mac4 send to mac2
				begin
					send_rx2tx(ff_rx_mod4_buf, ff_rx_sop4_buf, ff_rx_eop4_buf, ff_rx_dval4_buf, rx_err4_buf, ff_tx_mod2, ff_tx_sop2, ff_tx_eop2, ff_tx_wren2, ff_tx_err2);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send4)
						0:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data2);
						end	
						1:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data2);
						end
						2:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data2);
						end
						3:begin
							//cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(ff_rx_data4_buf,ff_tx_data2);
						end
						default: ;
					endcase
				end
			  end
		  4'b0100:					//send to mac3
			  begin
				if(input_port_reg == 4'b0001) 			//mac1 send to mac3
				begin
					send_rx2tx(ff_rx_mod1_buf, ff_rx_sop1_buf, ff_rx_eop1_buf, ff_rx_dval1_buf, rx_err1_buf, ff_tx_mod3, ff_tx_sop3, ff_tx_eop3, ff_tx_wren3, ff_tx_err3);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send1)
						0:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data3);
						end	
						1:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data3);
						end
						2:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data3);
						end
						3:begin
							//cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(ff_rx_data1_buf,ff_tx_data3);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0010)  			//mac2 send to mac3
				begin
					send_rx2tx(ff_rx_mod2_buf, ff_rx_sop2_buf, ff_rx_eop2_buf, ff_rx_dval2_buf, rx_err2_buf, ff_tx_mod3, ff_tx_sop3, ff_tx_eop3, ff_tx_wren3, ff_tx_err3);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send2)
						0:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data3);
						end	
						1:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data3);
						end
						2:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data3);
						end
						3:begin
							//cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(ff_rx_data2_buf,ff_tx_data3);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0100)  			//mac3 send to mac3
				begin
					send_rx2tx(ff_rx_mod3_buf, ff_rx_sop3_buf, ff_rx_eop3_buf, ff_rx_dval3_buf, rx_err3_buf, ff_tx_mod3, ff_tx_sop3, ff_tx_eop3, ff_tx_wren3, ff_tx_err3);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send3)
						0:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data3);
						end	
						1:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data3);
						end
						2:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data3);
						end
						3:begin
							//cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(ff_rx_data3_buf,ff_tx_data3);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b1000)  			//mac4 send to mac3
				begin
					send_rx2tx(ff_rx_mod4_buf, ff_rx_sop4_buf, ff_rx_eop4_buf, ff_rx_dval4_buf, rx_err4_buf, ff_tx_mod3, ff_tx_sop3, ff_tx_eop3, ff_tx_wren3, ff_tx_err3);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send4)
						0:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data3);
						end	
						1:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data3);
						end
						2:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data3);
						end
						3:begin
							//cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(ff_rx_data4_buf,ff_tx_data3);
						end
						default: ;
					endcase
				end
			  end
		  4'b1000:					//send to mac4
			  begin
				if(input_port_reg == 4'b0001) 			//mac1 send to mac4
				begin
					send_rx2tx(ff_rx_mod1_buf, ff_rx_sop1_buf, ff_rx_eop1_buf, ff_rx_dval1_buf, rx_err1_buf, ff_tx_mod4, ff_tx_sop4, ff_tx_eop4, ff_tx_wren4, ff_tx_err4);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send1)
						0:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data4);
						end	
						1:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data4);
						end
						2:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data4);
						end
						3:begin
							//cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(ff_rx_data1_buf,ff_tx_data4);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0010)  			//mac2 send to mac4
				begin
					send_rx2tx(ff_rx_mod2_buf, ff_rx_sop2_buf, ff_rx_eop2_buf, ff_rx_dval2_buf, rx_err2_buf, ff_tx_mod4, ff_tx_sop4, ff_tx_eop4, ff_tx_wren4, ff_tx_err4);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send2)
						0:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data4);
						end	
						1:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data4);
						end
						2:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data4);
						end
						3:begin
							//cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(ff_rx_data2_buf,ff_tx_data4);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0100)  			//mac3 send to mac4
				begin
					send_rx2tx(ff_rx_mod3_buf, ff_rx_sop3_buf, ff_rx_eop3_buf, ff_rx_dval3_buf, rx_err3_buf, ff_tx_mod4, ff_tx_sop4, ff_tx_eop4, ff_tx_wren4, ff_tx_err4);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send3)
						0:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data4);
						end	
						1:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data4);
						end
						2:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data4);
						end
						3:begin
							//cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(ff_rx_data3_buf,ff_tx_data4);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b1000)  			//mac4 send to mac4
				begin
					send_rx2tx(ff_rx_mod4_buf, ff_rx_sop4_buf, ff_rx_eop4_buf, ff_rx_dval4_buf, rx_err4_buf, ff_tx_mod4, ff_tx_sop4, ff_tx_eop4, ff_tx_wren4, ff_tx_err4);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send4)
						0:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data4);
						end	
						1:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data4);
						end
						2:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data4);
						end
						3:begin
							//cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(ff_rx_data4_buf,ff_tx_data4);
						end
						default: ;
					endcase
				end
			  end
		  4'b1111:					//send to every mac
			  begin
				if(input_port_reg == 4'b0001) 			//mac1 send to everyone
				begin
					// mac1 send to mac2
					send_rx2tx(ff_rx_mod1_buf, ff_rx_sop1_buf, ff_rx_eop1_buf, ff_rx_dval1_buf, rx_err1_buf, ff_tx_mod2, ff_tx_sop2, ff_tx_eop2, ff_tx_wren2, ff_tx_err2);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send1)
						0:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data2);
						end	
						1:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data2);
						end
						2:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data2);
						end
						3:begin
							//cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(ff_rx_data1_buf,ff_tx_data2);
						end
						default: ;
					endcase
					// mac1 send to mac3
					send_rx2tx(ff_rx_mod1_buf, ff_rx_sop1_buf, ff_rx_eop1_buf, ff_rx_dval1_buf, rx_err1_buf, ff_tx_mod3, ff_tx_sop3, ff_tx_eop3, ff_tx_wren3, ff_tx_err3);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send1)
						0:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data3);
						end	
						1:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data3);
						end
						2:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data3);
						end
						3:begin
							//cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(ff_rx_data1_buf,ff_tx_data3);
						end
						default: ;
					endcase
					// mac1 send to mac4
					send_rx2tx(ff_rx_mod1_buf, ff_rx_sop1_buf, ff_rx_eop1_buf, ff_rx_dval1_buf, rx_err1_buf, ff_tx_mod4, ff_tx_sop4, ff_tx_eop4, ff_tx_wren4, ff_tx_err4);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send1)
						0:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data4);
						end	
						1:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data4);
						end
						2:begin
							cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data4);
						end
						3:begin
							//cnt_addr_send1 <= cnt_addr_send1 + 1;
							send_rx2tx_data(ff_rx_data1_buf,ff_tx_data4);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0010)  			//mac2 send to everyone
				begin
					// mac2 send to mac1
					send_rx2tx(ff_rx_mod2_buf, ff_rx_sop2_buf, ff_rx_eop2_buf, ff_rx_dval2_buf, rx_err2_buf, ff_tx_mod1, ff_tx_sop1, ff_tx_eop1, ff_tx_wren1, ff_tx_err2);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send2)
						0:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data1);
						end	
						1:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data1);
						end
						2:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data1);
						end
						3:begin
							//cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(ff_rx_data2_buf,ff_tx_data1);
						end
						default: ;
					endcase
					// mac2 send to mac3
					send_rx2tx(ff_rx_mod2_buf, ff_rx_sop2_buf, ff_rx_eop2_buf, ff_rx_dval2_buf, rx_err2_buf, ff_tx_mod3, ff_tx_sop3, ff_tx_eop3, ff_tx_wren3, ff_tx_err3);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send2)
						0:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data3);
						end	
						1:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data3);
						end
						2:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data3);
						end
						3:begin
							//cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(ff_rx_data2_buf,ff_tx_data3);
						end
						default: ;
					endcase
					// mac2 send to mac4
					send_rx2tx(ff_rx_mod2_buf, ff_rx_sop2_buf, ff_rx_eop2_buf, ff_rx_dval2_buf, rx_err2_buf, ff_tx_mod4, ff_tx_sop4, ff_tx_eop4, ff_tx_wren4, ff_tx_err4);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send2)
						0:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data4);
						end	
						1:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data4);
						end
						2:begin
							cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data4);
						end
						3:begin
							//cnt_addr_send2 <= cnt_addr_send2 + 1;
							send_rx2tx_data(ff_rx_data2_buf,ff_tx_data4);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b0100)  			//mac3 send to everyone
				begin
					// mac3 send to mac1
					send_rx2tx(ff_rx_mod3_buf, ff_rx_sop3_buf, ff_rx_eop3_buf, ff_rx_dval3_buf, rx_err3_buf, ff_tx_mod1, ff_tx_sop1, ff_tx_eop1, ff_tx_wren1, ff_tx_err1);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send3)
						0:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data1);
						end	
						1:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data1);
						end
						2:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data1);
						end
						3:begin
							//cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(ff_rx_data3_buf,ff_tx_data1);
						end
						default: ;
					endcase
					// mac3 send to mac2
					send_rx2tx(ff_rx_mod3_buf, ff_rx_sop3_buf, ff_rx_eop3_buf, ff_rx_dval3_buf, rx_err3_buf, ff_tx_mod2, ff_tx_sop2, ff_tx_eop2, ff_tx_wren2, ff_tx_err2);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send3)
						0:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data2);
						end	
						1:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data2);
						end
						2:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data2);
						end
						3:begin
							//cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(ff_rx_data3_buf,ff_tx_data2);
						end
						default: ;
					endcase
					// mac3 send to mac4
					send_rx2tx(ff_rx_mod3_buf, ff_rx_sop3_buf, ff_rx_eop3_buf, ff_rx_dval3_buf, rx_err3_buf, ff_tx_mod4, ff_tx_sop4, ff_tx_eop4, ff_tx_wren4, ff_tx_err4);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send3)
						0:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data4);
						end	
						1:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data4);
						end
						2:begin
							cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data4);
						end
						3:begin
							//cnt_addr_send3 <= cnt_addr_send3 + 1;
							send_rx2tx_data(ff_rx_data3_buf,ff_tx_data4);
						end
						default: ;
					endcase
				end
				if(input_port_reg == 4'b1000)  			//mac4 send to everyone
				begin
					// mac4 send to mac1
					send_rx2tx(ff_rx_mod4_buf, ff_rx_sop4_buf, ff_rx_eop4_buf, ff_rx_dval4_buf, rx_err4_buf, ff_tx_mod1, ff_tx_sop1, ff_tx_eop1, ff_tx_wren1, ff_tx_err1);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send4)
						0:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data1);
						end	
						1:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data1);
						end
						2:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data1);
						end
						3:begin
							//cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(ff_rx_data4_buf,ff_tx_data1);
						end
						default: ;
					endcase
					// mac4 send to mac2
					send_rx2tx(ff_rx_mod4_buf, ff_rx_sop4_buf, ff_rx_eop4_buf, ff_rx_dval4_buf, rx_err4_buf, ff_tx_mod2, ff_tx_sop2, ff_tx_eop2, ff_tx_wren2, ff_tx_err2);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send4)
						0:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data2);
						end	
						1:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data2);
						end
						2:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data2);
						end
						3:begin
							//cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(ff_rx_data4_buf,ff_tx_data2);
						end
						default: ;
					endcase
					// mac4 send to mac3
					send_rx2tx(ff_rx_mod4_buf, ff_rx_sop4_buf, ff_rx_eop4_buf, ff_rx_dval4_buf, rx_err4_buf, ff_tx_mod3, ff_tx_sop3, ff_tx_eop3, ff_tx_wren3, ff_tx_err3);
//                                 1         | 2             | 3             | 4              | 5          | 1         | 2         | 3         | 4          | 5         |||||
					case(cnt_addr_send4)
						0:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[95:64],ff_tx_data3);
						end	
						1:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[63:32],ff_tx_data3);
						end
						2:begin
							cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(addr_fz[31:0 ],ff_tx_data3);
						end
						3:begin
							//cnt_addr_send4 <= cnt_addr_send4 + 1;
							send_rx2tx_data(ff_rx_data4_buf,ff_tx_data3);
						end
						default: ;
					endcase
				end
			  end
		  default: ;
		endcase
		
	end
	else begin
		cnt_addr_send1 <= 0;
		cnt_addr_send2 <= 0;
		cnt_addr_send3 <= 0;
		cnt_addr_send4 <= 0;
	end
end



//  	integer i;
//	integer j;
task send_rx2tx_data(     //定义tx_bit任务
  //32_rx  out 7 signals || in 1 signal		||mac1
  input [31:0 ] ff_rx_data,		//out-32********	||--ff_tx_data	/in
  
  //32_tx  out 3 signals || in 6 signals	||mac1
  output reg [31:0 ] ff_tx_data			//in-32********		||--ff_rx_data	/out

);
begin
	ff_tx_data = ff_rx_data;
	
end

endtask

task send_rx2tx;

  //32_rx  out 7 signals || in 1 signal		||mac1

  input [1 :0 ] ff_rx_mod;			//out-2				||--ff_tx_mod	/in
  input ff_rx_sop;				//out-1				||--ff_tx_sop	/in
  input ff_rx_eop;					//out-1				||--ff_tx_eop	/in
  input ff_rx_dval;				//out-1				||--ff_tx_wren	/in
  input [5:0] rx_err;					//out-6				||--ff_tx_err	/in-1
  
  //32_tx  out 3 signals || in 6 signals	||mac1

  output reg [1 :0 ] ff_tx_mod;	//in-2				||--ff_rx_mod	/out
  output reg ff_tx_sop;			//in-1				||--ff_rx_sop	/out
  output reg ff_tx_eop;			//in-1				||--ff_rx_eop	/out
  output reg ff_tx_wren;			//in-1				||--ff_rx_dval	/out
  output reg ff_tx_err;			//in-1				||--rx_err		/out-6

begin


	ff_tx_mod  = ff_rx_mod;
	ff_tx_sop  = ff_rx_sop;
	ff_tx_eop  = ff_rx_eop;
	ff_tx_wren = ff_rx_dval;
	ff_tx_err  = rx_err[0];
	
end

endtask



/////////////////////////////////////////////////////////////////

endmodule
  


  
