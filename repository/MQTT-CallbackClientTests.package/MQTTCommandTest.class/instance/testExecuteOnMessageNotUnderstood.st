tests
testExecuteOnMessageNotUnderstood
	command
		actionBlock: [ results add: #action.
			MessageNotUnderstood signal ].
	self
		should: [ command executeOn: client ]
		raise: MessageNotUnderstood.
	self assert: results asArray equals: #(action)