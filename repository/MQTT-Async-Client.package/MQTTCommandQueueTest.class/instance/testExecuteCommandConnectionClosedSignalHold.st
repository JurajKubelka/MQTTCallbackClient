tests
testExecuteCommandConnectionClosedSignalHold
	command actionBlock: [ :client | 
		results add: #action.
		client isReallyConnected: false.
		ConnectionClosed signal ].
	command hold.
	queue basicAdd: command.
	queue executeCommand.
	self assert: queue size equals: 1.
	self assert: results asArray equals: #(action error).