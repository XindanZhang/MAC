U_clockGenerator.RESET;


//testcase_name = "0100000065" ;
a = "MAC_1_65" ;
b = "MAC_2_65" ;
c = "MAC_3_65" ;
d = "MAC_4_65 " ;

mode=1'b1;
CHOOSE_MODE;
#100;
   i=0;
repeat(100)
begin
   data_cnt=i;
   len = 64 + {$random}%(1518 - 64);
   U_ephy_hm.send_frame_1000M(len, data_cnt);
   $display("%d   %d",$realtime, i);
   i = i + 1;
	// data_cnt = data_cnt + 1;
end

$display("\n %d %s is done!!!-----------------------------------------",$realtime, testcase_name);

# 1000;   
U_data_cmp.OVER;
U_data_cmp2.OVER;
U_data_cmp3.OVER;
U_data_cmp4.OVER;