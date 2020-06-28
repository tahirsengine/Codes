onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb/a
add wave -noupdate -radix unsigned /tb/b
add wave -noupdate /tb/funct
add wave -noupdate -radix unsigned /tb/out
add wave -noupdate -expand -group system /tb/inst/a
add wave -noupdate -expand -group system /tb/inst/b
add wave -noupdate -expand -group system /tb/inst/funct
add wave -noupdate -expand -group system /tb/inst/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {33600 ps}
