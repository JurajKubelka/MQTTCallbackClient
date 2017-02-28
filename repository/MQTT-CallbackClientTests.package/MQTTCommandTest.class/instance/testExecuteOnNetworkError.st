tests
testExecuteOnNetworkError
	command
		actionBlock: [ results add: #action.
			NetworkError signal ].
	self should: [ command executeOn: client ] raise: NetworkError.
	self assert: results asArray equals: #(action)