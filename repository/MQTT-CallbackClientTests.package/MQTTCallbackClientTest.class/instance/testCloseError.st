tests
testCloseError
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open;
		close: [ self addToResults: #close ] 
		error: [ :exception | self addToResults: exception ].
	self assertSemaphore: 2.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(cycle close cycle).
	self deny: client isConnected.
	self deny: client isActive.