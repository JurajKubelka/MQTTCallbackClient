tests
testMaxDelayDuration4
	command maxDelayDuration: 10 seconds.
	self assert: (command delayDuration; delayDuration) equals: 3 seconds