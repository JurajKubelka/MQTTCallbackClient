tests
testPingErrorNotConnected
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		ping: [ self addToResults: #ping ] 
		error: [ :exception | self addToResults: exception className ].
	self assertSemaphore: 1.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(ConnectionClosed cycle).
	self deny: client isConnected.
	self deny: client isActive.