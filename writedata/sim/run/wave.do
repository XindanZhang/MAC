onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk128
add wave -noupdate /testbench/clk125
add wave -noupdate /testbench/miiTxClk
add wave -noupdate /testbench/miiRxClk
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/Rx_clk
add wave -noupdate /testbench/Tx_clk
#add wave -noupdate /testbench/hm_Rx_er
#add wave -noupdate /testbench/hm_Rx_dv
#add wave -noupdate /testbench/hm_Rxd
#add wave -noupdate /testbench/hm_Tx_en
#add wave -noupdate /testbench/hm_Txd
#add wave -noupdate /testbench/mode
#add wave -noupdate /testbench/testcase_name
#add wave -noupdate /testbench/hm_Crs
#add wave -noupdate /testbench/hm_Col
#add wave -noupdate /testbench/mac_speed
#add wave -noupdate /testbench/dpram21_wren
#add wave -noupdate /testbench/dpram21_rden
#add wave -noupdate /testbench/dpram21_addr
#add wave -noupdate /testbench/dpram21_data_out
#add wave -noupdate /testbench/mac_ca
#add wave -noupdate /testbench/mac_cd_in
#add wave -noupdate /testbench/mac_csb
#add wave -noupdate /testbench/mac_wrb
#add wave -noupdate /testbench/rdy
#add wave -noupdate /testbench/mode_switch
#add wave -noupdate /testbench/ff_rx_data_mac
#add wave -noupdate /testbench/ff_rx_mod_mac
#add wave -noupdate /testbench/rx_err_mac
#add wave -noupdate /testbench/mac_cd_out
#add wave -noupdate /testbench/ff_rx_sop_mac
#add wave -noupdate /testbench/ff_rx_eop_mac
#add wave -noupdate /testbench/ff_rx_dsav_mac
#add wave -noupdate /testbench/ff_rx_dval_mac
#add wave -noupdate /testbench/ff_tx_err
#add wave -noupdate /testbench/tx_ff_uflow
#add wave -noupdate /testbench/ff_tx_rdy
#add wave -noupdate /testbench/ff_tx_septy
#add wave -noupdate /testbench/i
#add wave -noupdate /testbench/len
#add wave -noupdate /testbench/data_cnt

add wave -noupdate  /testbench/MAC_top_inst1/ff_tx_data
add wave -noupdate  /testbench/MAC_top_inst1/ff_rx_data
add wave -noupdate  /testbench/MAC_top_inst1/Txd
add wave -noupdate  /testbench/MAC_top_inst1/Rxd
#add wave -noupdate  /testbench/MAC_top_inst1/Tx_mac_data
#add wave -noupdate  /testbench/MAC_top_inst1/Rx_mac_data

add wave -noupdate  /testbench/MAC_top_inst2/ff_tx_data
add wave -noupdate  /testbench/MAC_top_inst2/ff_rx_data
add wave -noupdate  /testbench/MAC_top_inst2/Txd
add wave -noupdate  /testbench/MAC_top_inst2/Rxd
#add wave -noupdate  /testbench/MAC_top_inst2/Tx_mac_data
#add wave -noupdate  /testbench/MAC_top_inst2/Rx_mac_data

add wave -noupdate  /testbench/MAC_top_inst3/ff_tx_data
add wave -noupdate  /testbench/MAC_top_inst3/ff_rx_data
add wave -noupdate  /testbench/MAC_top_inst3/Txd
add wave -noupdate  /testbench/MAC_top_inst3/Rxd
#add wave -noupdate  /testbench/MAC_top_inst3/Tx_mac_data
#add wave -noupdate  /testbench/MAC_top_inst3/Rx_mac_data

add wave -noupdate  /testbench/MAC_top_inst4/ff_tx_data
add wave -noupdate  /testbench/MAC_top_inst4/ff_rx_data
add wave -noupdate  /testbench/MAC_top_inst4/Txd
add wave -noupdate  /testbench/MAC_top_inst4/Rxd
#add wave -noupdate  /testbench/MAC_top_inst4/Tx_mac_data
#add wave -noupdate  /testbench/MAC_top_inst4/Rx_mac_data

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2835153008 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 241
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2000000000 ns}
