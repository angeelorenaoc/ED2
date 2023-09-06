transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_II {U:/ED2/Laboratorio/Practica_II/Alu.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_II {U:/ED2/Laboratorio/Practica_II/converter.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_II {U:/ED2/Laboratorio/Practica_II/counterpulse.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_II {U:/ED2/Laboratorio/Practica_II/pulse.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_II {U:/ED2/Laboratorio/Practica_II/deco7seg.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_II {U:/ED2/Laboratorio/Practica_II/nbitAdder.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_II {U:/ED2/Laboratorio/Practica_II/main.sv}

