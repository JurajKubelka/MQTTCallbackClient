tests
testOpenError
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open: [ self addToResults: #open. ] 
		error: [ :exception | self addToResults: exception. exception pass ].
	self assertSemaphore: 2.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(open cycle cycle).
	self assert: client isConnected.
	self deny: client isActive.