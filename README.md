# Tcl UDP examples

These examples assume you have scotty installed, for the Tnm examples, and tcludp installed, for the tcludp examples.

We are using scotty from https://github.com/flightaware/scotty

We are using tcludp from https://github.com/mpcjanssen/tcludp

* tcludp-client.tcl - run a client that reads from stdin and sends lines to localhost port 7652 using tcludp

* tnm-client.tcl - run a client that reads from stdin and sends lines to localhost port 7652 using Tnm

* tcludp-server.tcl - run a server that reads from port 7652 and emits what it gets to stdout


### FreeBSD

What we find on FreeBSD is that using either client program, the server program runs "one message behind" at all times, meaning the first message is only "received" by Tcl after the second message has been received, the second message is only received by Tcl once the third message has been sent and so on.

When we change to line buffered, things work better, but we still get a callback every other message with no data (gets returns < 0).

### nc

this is another way to send:

```
nc -u 127.0.0.1 7652
```

