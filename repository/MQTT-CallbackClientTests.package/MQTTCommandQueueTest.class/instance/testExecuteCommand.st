tests
testExecuteCommand
	queue basicAdd: command.
	queue executeCommand.
	self assert: queue size equals: 0.
	self assert: results asArray equals: #(action response).