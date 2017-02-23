tests
testPingErrorConnectionClosed
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open: [ self addToResults: #open ] error: [ self addToResults: #openError ].
	self assertSemaphore: 2.
	client basicCloseSocket.
	client
		ping: [ self addToResults: #ping ] 
		error: [ :exception | self addToResults: exception className. ].
	self assertSemaphore: 1.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(open cycle cycle ConnectionClosed cycle).
	self deny: client isConnected.
	self deny: client isActive.