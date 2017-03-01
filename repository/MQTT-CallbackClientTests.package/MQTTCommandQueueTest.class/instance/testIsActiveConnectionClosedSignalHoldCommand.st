tests
testIsActiveConnectionClosedSignalHoldCommand
	command hold.
	queue basicAdd: command.
	queue executeCommand.
	self assert: queue size equals: 1.
	self assert: results asArray equals: #(action response).
	self deny: command isOnHold.
	mqttClient isReallyConnected: false.
	mqttClient action: [ ConnectionClosed signal ].
	queue executeCommand.
	self assert: queue size equals: 0.
	self assert: results asArray equals: #(action response action error).