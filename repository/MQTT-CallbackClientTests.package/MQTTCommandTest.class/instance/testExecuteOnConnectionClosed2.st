tests
testExecuteOnConnectionClosed2
	command
		actionBlock: [ :aClient :aCommand | 
			results add: #action.
			ConnectionClosed signal ].
	self should: [ command executeOn: client ] raise: ConnectionClosed.
	self assert: results asArray equals: #(action)