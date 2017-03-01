tests
testExecuteOn
	command executeOn: client.
	self assert: results asArray equals: #(action response)