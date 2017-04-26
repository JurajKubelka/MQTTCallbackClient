tests
testMaxReconnectionDelay2
	"Ensure that the reconenction command has the value."
	| command |
	command := MQTTAutoReconnect new.
	client maxReconnectionDelay: 42 seconds.
	client reopen: command.
	self assert: client maxReconnectionDelay equals: 42 seconds.
	self assert: command maxDelayDuration equals: 42 seconds.