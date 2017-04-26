tests
testMaxDelayDuration6
	command maxDelayDuration: 10 seconds.
	self assert: (command delayDuration; delayDuration; delayDuration; delayDuration) equals: 10 seconds