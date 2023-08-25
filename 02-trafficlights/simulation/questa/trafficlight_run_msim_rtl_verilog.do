transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/02-trafficlights {C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/02-trafficlights/cntdiv_n.sv}
vlog -sv -work work +incdir+C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/02-trafficlights {C:/Users/oscar/OneDrive/Documentos/Trabajos/ED_2/02-trafficlights/trafficlight.sv}

