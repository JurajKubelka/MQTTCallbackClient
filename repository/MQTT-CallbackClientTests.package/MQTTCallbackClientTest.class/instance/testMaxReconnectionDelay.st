tests
testMaxReconnectionDelay
	client maxReconnectionDelay: 42 seconds.
	self assert: client maxReconnectionDelay equals: 42 seconds.
