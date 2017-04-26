tests
testMaxReconnectionDelay3
	"Ensure that the reconenction command has the value."
	| command |
	command := MQTTAutoReconnect new.
	client reopen: command.
	client maxReconnectionDelay: 42 seconds.
	self assert: client maxReconnectionDelay equals: 42 seconds.
	self assert: command maxDelayDuration equals: 42 seconds.