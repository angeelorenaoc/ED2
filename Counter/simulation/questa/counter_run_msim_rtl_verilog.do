transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/Counter {C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/Counter/cntdiv_n.sv}
vlog -sv -work work +incdir+C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/Counter {C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/Counter/contador.sv}
vlog -sv -work work +incdir+C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/Counter {C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/Counter/deco7seg_hexa.sv}
vlog -sv -work work +incdir+C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/Counter {C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/Counter/main.sv}

