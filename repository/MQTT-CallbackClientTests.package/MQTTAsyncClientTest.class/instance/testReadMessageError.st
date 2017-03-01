tests
testReadMessageError
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open;
		subscribeToTopic: self topic;
		sendMessage: self bytes toTopic: self topic;
		readMessage: [ self addToResults: #read ]
		error: [ :exception | self addToResults: exception. exception pass ].
	self assertSemaphore: 5.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(cycle cycle cycle read cycle cycle).
	self assert: client isConnected.
	self deny: client isActive.