tests
testExecuteOnReconnect2
	command := self newCommand.
	client isReallyConnected: false.
	command suspendBlock: [ :duration :time :cmd |
		command now.
		duration > 13 seconds ifTrue: [ client isReallyConnected: true ].
		results add: duration ].
	command executeOn: client.
	self assert: command delayDuration equals: 0 seconds.
	self assert: results asArray equals: { 0 seconds. 3 seconds. 12 seconds. 39 seconds }.
	