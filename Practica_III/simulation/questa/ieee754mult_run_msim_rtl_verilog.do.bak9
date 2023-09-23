transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_III {U:/ED2/Laboratorio/Practica_III/peripheral_pulse.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_III {U:/ED2/Laboratorio/Practica_III/peripheral_deco7seg.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_III {U:/ED2/Laboratorio/Practica_III/top.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_III {U:/ED2/Laboratorio/Practica_III/controlunit.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_III {U:/ED2/Laboratorio/Practica_III/datapathunit.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_III {U:/ED2/Laboratorio/Practica_III/peripherals.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_III {U:/ED2/Laboratorio/Practica_III/peripheral_getoperands.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_III {U:/ED2/Laboratorio/Practica_III/multiplierunit.sv}

