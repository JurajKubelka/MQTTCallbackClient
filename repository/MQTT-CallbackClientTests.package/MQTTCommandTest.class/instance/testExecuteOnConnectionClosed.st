tests
testExecuteOnConnectionClosed
	command
		actionBlock: [ :aClient :aCommand | 
			results add: #action.
			aClient isReallyConnected: false.
			ConnectionClosed signal ].
	self should: [ command executeOn: client ] raise: ConnectionClosed.
	self assert: results asArray equals: #(action)