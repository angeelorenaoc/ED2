transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/oscar/Downloads/01-firstExample {C:/Users/oscar/Downloads/01-firstExample/cntdiv_n.sv}
vlog -sv -work work +incdir+C:/Users/oscar/Downloads/01-firstExample {C:/Users/oscar/Downloads/01-firstExample/main.sv}
vlog -sv -work work +incdir+C:/Users/oscar/Downloads/01-firstExample {C:/Users/oscar/Downloads/01-firstExample/shift_led_v2.sv}

