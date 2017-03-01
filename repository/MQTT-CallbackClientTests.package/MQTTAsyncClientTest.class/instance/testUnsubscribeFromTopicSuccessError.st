tests
testUnsubscribeFromTopicSuccessError
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open;
		subscribeToTopic: self topic;
		unsubscribeFromTopic: self topic
			success: [ self addToResults: #unsubscribe ]
			error: [ :exception | self addToResults: exception. exception pass ].
	self assertSemaphore: 4.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(cycle cycle unsubscribe cycle cycle).
	self assert: client isConnected.
	self deny: client isActive.