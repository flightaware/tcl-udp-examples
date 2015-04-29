#
# client example using tcludp
#
#

package require udp

proc main {{argv ""}} {
	set sock [udp_open]
	fconfigure $sock -buffering line -translation binary -remote [list localhost 7652]
	puts [fconfigure $sock]

	puts "type stuff"

	while {[gets stdin line] >= 0} {
		puts "writing '$line'"
		puts $sock $line
		#puts -nonewline $sock $line
		#flush $sock
	}
}

if !$tcl_interactive {
	main $argv
}
