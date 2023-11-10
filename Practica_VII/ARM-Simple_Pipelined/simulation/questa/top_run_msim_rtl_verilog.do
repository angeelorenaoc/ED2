transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/top.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/arm.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/controller.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/decoder.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/condlogic.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/datapath.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/regfile.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/alu.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/extend.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/adder.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/mux2.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/flopr.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/flopenr.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/shifter.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/regfileF.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/regfileD.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/regfileEM.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/regfileCF.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/regfileCMW.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/imem.sv}
vlog -sv -work work +incdir+U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined {U:/ED2/Laboratorio/Practica_VII/ARM-Simple_Pipelined/dmem.sv}

