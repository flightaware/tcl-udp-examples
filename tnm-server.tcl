#
# server example using tcludp
#
#

package require Tnm

proc udp_callback {} {
	lassign [$::udpHandle receive]  clientaddr clientport message
	set message [string trimright $message "\r\n"]
	puts "received [string length $message] chars from peer $clientaddr $clientport: '$message'"
}


proc main {{argv ""}} {
	set ::udpHandle [Tnm::udp create -read udp_callback -myport 7652]

	puts "listening on udp port: 7652"

	vwait die
}

if !$tcl_interactive {
	main $argv
}
