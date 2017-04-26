tests
testMaxDelayDuration3
	command maxDelayDuration: 10 seconds.
	self assert: command delayDuration equals: 0 seconds