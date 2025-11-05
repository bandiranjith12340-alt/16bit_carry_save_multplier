set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib/
set_db library slow.lib
set_db init_hdl_search_path {./csa_multiplier_16bit.v}
read_hdl csa_multiplier_16bit.v
elaborate csa_multiplier_16bit
read_sdc csa_multiplier_16bit.sdc
syn_generic
syn_map
syn_opt
write_hdl > outputs/csa_multiplier_16bit.v
write_sdf > outputs/csa_multiplier_16bit.sdf
write_sdc > outputs/csa_multiplier_16bit_syn.sdc
report_area > reports/area.rpt
report_timing > reports/timing.rpt
report_power > reports/power.rpt
gui_show
