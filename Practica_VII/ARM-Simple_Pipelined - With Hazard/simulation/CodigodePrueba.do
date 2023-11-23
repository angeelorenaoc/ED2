onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/clk
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/reset
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/InstrF
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/InstrD
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/FlushD
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/FlushE
add wave -noupdate /testbench_peripherals/dut/arm/c/RFFetchC/FlushE
add wave -noupdate /testbench_peripherals/dut/arm/dp/StallDn
add wave -noupdate /testbench_peripherals/dut/arm/dp/StallF
add wave -noupdate /testbench_peripherals/dut/arm/dp/StallFn
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/HU/PCSrcD
add wave -noupdate /testbench_peripherals/dut/arm/c/RFFetchC/PcsrcDaux
add wave -noupdate /testbench_peripherals/dut/arm/c/RFFetchC/PcsrcE
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/HU/PCSrcE
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/HU/PCSrcM
add wave -noupdate /testbench_peripherals/dut/arm/HU/PCWrPendingF
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/BranchtakenE
add wave -noupdate -radix hexadecimal -childformat {{{/testbench_peripherals/dut/arm/dp/rf/rf[14]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[13]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[12]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[11]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[10]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[9]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[8]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[7]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[6]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[5]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[4]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[3]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[2]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[1]} -radix hexadecimal} {{/testbench_peripherals/dut/arm/dp/rf/rf[0]} -radix hexadecimal}} -expand -subitemconfig {{/testbench_peripherals/dut/arm/dp/rf/rf[14]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[13]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[12]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[11]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[10]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[9]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[8]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[7]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[6]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[5]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[4]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[3]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[2]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[1]} {-height 15 -radix hexadecimal} {/testbench_peripherals/dut/arm/dp/rf/rf[0]} {-height 15 -radix hexadecimal}} /testbench_peripherals/dut/arm/dp/rf/rf
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/rf/r15
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/Result
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/alu/A
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/alu/B
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/ALUResultE
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcreg/d
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcreg/enable
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcreg/q
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/PCNext
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/PCSrc
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/PCNextRemix
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcmuxremix/d0
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcmuxremix/d1
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcmuxremix/s
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcmuxremix/y
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcmux/d0
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcmux/d1
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcmux/s
add wave -noupdate -radix hexadecimal /testbench_peripherals/dut/arm/dp/pcmux/y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {39 ps} 0}
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
WaveRestoreZoom {0 ps} {103 ps}
