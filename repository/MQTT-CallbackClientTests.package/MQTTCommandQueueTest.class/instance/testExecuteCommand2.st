tests
testExecuteCommand2
	queue executeCommand.
	self assert: queue size equals: 0.
	self assert: results asArray equals: #().