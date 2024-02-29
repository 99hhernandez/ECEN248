## This file is a general .xdc for the ZYBO Rev B board

##Buttons
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { btn[0] }]; #IO_L12N_T1_MRCC_35 Sch=btn[0]
#set_property -dict { PACKAGE_PIN P16   IOSTANDARD LVCMOS33 } [get_ports { btn[1] }]; #IO_L24N_T3_34 Sch=btn[1]
#set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { btn[2] }]; #IO_L10P_T1_AD11P_35 Sch=btn[2]
#set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { btn[3] }]; #IO_L7P_T1_34 Sch=btn[3]

##Switches
#set_property -dict { PACKAGE_PIN G15   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; #IO_L19N_T3_VREF_35 Sch=sw[0]
#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; #IO_L24P_T3_34 Sch=sw[1]
#set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; #IO_L4N_T0_34 Sch=sw[2]
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; #IO_L9P_T1_DQS_34 Sch=sw[3]

##Buttons
##IO_L20N_T3_34 #Button0
#set_property PACKAGE_PIN R18 [get_ports {W[0]}]
set_property PACKAGE_PIN K18 [get_ports {W[0]}]
#set_property PACKAGE_PIN G15 [get_ports {W[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {W[0]}]

##IO_L24N_T3_34 #Button1
set_property PACKAGE_PIN P16 [get_ports {W[1]}]
#set_property PACKAGE_PIN P15 [get_ports {W[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {W[1]}]

##IO_L18P_T2_34 #Button2
#set_property PACKAGE_PIN V16 [get_ports {W[2]}]
set_property PACKAGE_PIN K19 [get_ports {W[2]}]
#set_property PACKAGE_PIN w13 [get_ports {W[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {W[2]}]

##IO_L7P_T1_34 #Button3
set_property PACKAGE_PIN Y16 [get_ports {W[3]}]
#set_property PACKAGE_PIN T16 [get_ports {W[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {W[3]}]

##LEDs
##IO_L23P_T3_35  #LED0
set_property PACKAGE_PIN M14 [get_ports {Y[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Y[0]}]

##IO_L23N_T3_35  #LED1
set_property PACKAGE_PIN M15 [get_ports {Y[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Y[1]}]

##IO_0_35  #LED2
set_property PACKAGE_PIN G14 [get_ports {zero}]
set_property IOSTANDARD LVCMOS33 [get_ports {zero}]

