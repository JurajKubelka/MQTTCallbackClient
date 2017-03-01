tests
testWait
	command := self newCommand.
	command suspendBlock: [ :duration :time :cmd |
		command now.
		results add: duration ].
	command wait: client.
	self assert: results asArray equals: { 0 seconds }.	