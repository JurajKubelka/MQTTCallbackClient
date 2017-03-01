tests
testExecuteCommandConnectionClosedSignal
	command actionBlock: [ results add: #action. ConnectionClosed signal ].
	queue basicAdd: command.
	queue executeCommand.
	self assert: queue size equals: 0.
	self assert: results asArray equals: #(action error).