vlib work
vlog *.v
vsim  -gui work.tb -do wave.do
run -all


if 0 {
vsim -->
The vsim command invokes the VSIM simulator

-gui -->  
(optional) Starts the ModelSim GUI without loading a design and redirects the standard
output (stdout) to the GUI Transcript window.


-do wave.do -->
-do “<command_string>” | <do_file_name>
(optional) Instructs vsim to use the command(s) specified by <command_string> or the DO
file named by <do_file_name> rather than the startup file specified in the .ini file, if any. 
}