tests
testExecuteOnReconnect
	command := self newCommand.
	command executeOn: client.
	self assert: command delayDuration equals: 0 seconds