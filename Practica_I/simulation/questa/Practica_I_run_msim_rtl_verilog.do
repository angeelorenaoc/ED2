transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/oscar/Documents/ED/Practica_I {C:/Users/oscar/Documents/ED/Practica_I/cntdiv_n.sv}
vlog -sv -work work +incdir+C:/Users/oscar/Documents/ED/Practica_I {C:/Users/oscar/Documents/ED/Practica_I/fsm.sv}
vlog -sv -work work +incdir+C:/Users/oscar/Documents/ED/Practica_I {C:/Users/oscar/Documents/ED/Practica_I/converter.sv}
vlog -sv -work work +incdir+C:/Users/oscar/Documents/ED/Practica_I {C:/Users/oscar/Documents/ED/Practica_I/deco7seg.sv}
vlog -sv -work work +incdir+C:/Users/oscar/Documents/ED/Practica_I {C:/Users/oscar/Documents/ED/Practica_I/main.sv}

