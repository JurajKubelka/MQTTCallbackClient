tests
testExecuteCommandHold
	queue basicAdd: command.
	command hold.
	queue executeCommand.
	self assert: queue size equals: 1.
	self assert: results asArray equals: #(action response).
	self 
		deny: command isOnHold 
		description: 'The isOnHold flag should be reset after command execution'