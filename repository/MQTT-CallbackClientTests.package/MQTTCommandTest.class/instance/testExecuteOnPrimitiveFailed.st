tests
testExecuteOnPrimitiveFailed
	command
		actionBlock: [ results add: #action.
			PrimitiveFailed signal ].
	self should: [ command executeOn: client ] raise: PrimitiveFailed.
	self assert: results asArray equals: #(action)