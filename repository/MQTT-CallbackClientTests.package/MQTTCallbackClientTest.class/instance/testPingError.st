tests
testPingError
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open;
		ping: [ self addToResults: #ping ]
		error: [ :exception | self addToResults: exception. exception pass ].
	self assertSemaphore: 3.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(cycle ping cycle cycle).
	self assert: client isConnected.
	self deny: client isActive.