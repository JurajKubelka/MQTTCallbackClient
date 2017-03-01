accessing
flush
	"It removes all commands in the queue."
	^ mutex critical: [ queue flush ]