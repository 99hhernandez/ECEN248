##Clock signal
##IO_L11P_T1_SRCC_35	
#set_property PACKAGE_PIN L16 [get_ports ClkIn]
set_property PACKAGE_PIN K17 [get_ports ClkIn]
set_property IOSTANDARD LVCMOS33 [get_ports ClkIn]
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 8} [get_ports ClkIn]

##Pmod Header JC                                                                                                                  
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33     } [get_ports { jc[0] }]; #IO_L10P_T1_34 Sch=jc_p[1]   			 
#set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33     } [get_ports { jc[1] }]; #IO_L10N_T1_34 Sch=jc_n[1]		     
#set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33     } [get_ports { jc[2] }]; #IO_L1P_T0_34 Sch=jc_p[2]              
#set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33     } [get_ports { jc[3] }]; #IO_L1N_T0_34 Sch=jc_n[2]              
#set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33     } [get_ports { jc[4] }]; #IO_L8P_T1_34 Sch=jc_p[3]              
#set_property -dict { PACKAGE_PIN Y14   IOSTANDARD LVCMOS33     } [get_ports { jc[5] }]; #IO_L8N_T1_34 Sch=jc_n[3]              
#set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33     } [get_ports { jc[6] }]; #IO_L2P_T0_34 Sch=jc_p[4]              
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33     } [get_ports { jc[7] }]; #IO_L2N_T0_34 Sch=jc_n[4]              
                                                                                                                                 
###Pmod Header JB
###IO_L15N_T2_DQS_34
#set_property PACKAGE_PIN U20 [get_ports {ClkOut[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ClkOut[0]}]
#
###IO_L15P_T2_DQS_34
#set_property PACKAGE_PIN T20 [get_ports {ClkOut[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ClkOut[1]}]
#
###IO_L16N_T2_34
#set_property PACKAGE_PIN W20 [get_ports {ClkOut[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ClkOut[2]}]
#
###IO_L16P_T2_34
#set_property PACKAGE_PIN V20 [get_ports {ClkOut[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ClkOut[3]}]

##Pmod Header JC
##IO_L15N_T2_DQS_34
set_property PACKAGE_PIN W15 [get_ports {ClkOut[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {ClkOut[0]}]

##IO_L15P_T2_DQS_34
set_property PACKAGE_PIN V15 [get_ports {ClkOut[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {ClkOut[1]}]

##IO_L16N_T2_34
set_property PACKAGE_PIN T10 [get_ports {ClkOut[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {ClkOut[2]}]

##IO_L16P_T2_34
set_property PACKAGE_PIN T11 [get_ports {ClkOut[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ClkOut[3]}]


