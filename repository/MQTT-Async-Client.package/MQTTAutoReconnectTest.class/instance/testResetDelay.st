tests
testResetDelay
	command delayDuration; delayDuration; delayDuration; delayDuration.
	command resetDelayDuration.
	self assert: command delayDuration equals: 0 seconds