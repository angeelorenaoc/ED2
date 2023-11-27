onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/clk
add wave -noupdate -radix hexadecimal /testbench_peripherals/leds
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/InstrF
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/InstrD
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/InstrE
add wave -noupdate -radix hexadecimal -childformat {{{/testbench_peripherals/dut/arm/dp/rf/rf[14]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[13]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[12]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[11]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[10]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[9]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[8]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[7]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[6]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[5]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[4]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[3]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[2]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[1]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[0]} -radix hexadecimal}} -subitemconfig {{/testbench_peripherals/dut/arm/dp/rf/rf[14]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[13]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[12]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[11]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[10]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[9]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[8]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[7]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[6]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[5]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[4]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[3]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[2]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[1]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[0]} {-height 15 -radix hexadecimal}} /testbench_peripherals/dut/arm/dp/rf/rf
add wave -noupdate -radix hexadecimal -childformat {{{/testbench_peripherals/dut/arm/dp/rf/r15[31]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[30]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[29]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[28]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[27]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[26]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[25]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[24]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[23]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[22]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[21]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[20]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[19]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[18]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[17]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[16]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[15]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[14]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[13]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[12]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[11]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[10]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[9]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[8]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[7]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[6]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[5]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[4]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[3]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[2]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[1]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/r15[0]} -radix hexadecimal}} -subitemconfig {{/testbench_peripherals/dut/arm/dp/rf/r15[31]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[30]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[29]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[28]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[27]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[26]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[25]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[24]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[23]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[22]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[21]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[20]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[19]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[18]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[17]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[16]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[15]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[14]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[13]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[12]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[11]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[10]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[9]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[8]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[7]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[6]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[5]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[4]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[3]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[2]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[1]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/r15[0]} {-height 15 -radix hexadecimal}} /testbench_peripherals/dut/arm/dp/rf/r15
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/PC
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/FlushD
add wave -noupdate /testbench_peripherals/dut/arm/dp/StallDn
add wave -noupdate /testbench_peripherals/dut/arm/dp/StallFn
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/BranchtakenE
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/Result
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/ALUResultE
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/PCNext
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/PCNextRemix
add wave -noupdate -radix hexadecimal -childformat {{{/testbench_peripherals/dut/arm/dp/ALUOutM[31]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[30]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[29]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[28]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[27]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[26]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[25]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[24]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[23]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[22]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[21]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[20]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[19]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[18]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[17]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[16]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[15]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[14]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[13]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[12]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[11]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[10]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[9]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[8]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[7]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[6]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[5]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[4]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[3]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[2]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[1]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/ALUOutM[0]} -radix hexadecimal}} -subitemconfig {{/testbench_peripherals/dut/arm/dp/ALUOutM[31]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[30]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[29]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[28]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[27]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[26]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[25]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[24]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[23]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[22]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[21]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[20]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[19]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[18]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[17]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[16]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[15]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[14]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[13]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[12]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[11]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[10]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[9]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[8]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[7]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[6]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[5]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[4]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[3]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[2]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[1]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/ALUOutM[0]} {-height 15 -radix hexadecimal}} /testbench_peripherals/dut/arm/dp/ALUOutM
add wave -noupdate /testbench_peripherals/dut/arm/dp/alu/ALUControl
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/alu/A
add wave -noupdate -radix decimal /testbench_peripherals/dut/arm/dp/alu/B
add wave -noupdate /testbench_peripherals/dut/arm/c/ALUFlagsE
add wave -noupdate /testbench_peripherals/dut/arm/dp/alu/ALUFlags
add wave -noupdate /testbench_peripherals/dut/arm/dp/ALUFlags
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/Result
add wave -noupdate /testbench_peripherals/dut/arm/c/cl/Flags
add wave -noupdate /testbench_peripherals/dut/arm/c/cl/FlagsE
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/Rd1E
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/Rd2E
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {135 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 343
configure wave -valuecolwidth 92
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {111 ps} {205 ps}
