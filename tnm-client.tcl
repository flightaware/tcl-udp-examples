

package require Tnm

proc main {{argv ""}} {
	set udp [Tnm::udp create]

	puts "type stuff"

	while {[gets stdin line] >= 0} {
		puts "writing '$line'"
		$udp send localhost 7652 $line
	}
}

if !$tcl_interactive {
	main $argv
}
