

package require udp

proc udp_callback {sock} {
	if {[gets $sock packet] < 0} {
		puts "nothing there"
	}
	set peer [fconfigure $sock -peer]
	puts "received [string length $packet] chars from peer $peer: '$packet'"
}


proc main {{argv ""}} {
	#set sock [udp_open -myport 7652]
	set sock [udp_open 7652]
	fconfigure $sock -buffering none -translation binary -blocking 0

	fileevent $sock  readable [list udp_callback $sock]

	puts "listening on udp port: [fconfigure $sock -myport]"

	vwait die
}

if !$tcl_interactive {
	main $argv
}
