vlib work
vlog *.v
vsim -gui work.tb
add wave sim:/tb/*
run -all


if 0 {

vlib -->
Creates and work library, if already exiting then doesnt do anything.

vsim -->
The vsim command invokes the VSIM simulator

-gui -->
(optional) Starts the ModelSim GUI without loading a design and redirects the standard
output (stdout) to the GUI Transcript window.


add wave sim -->
adds all signals from tb to wave file
}
