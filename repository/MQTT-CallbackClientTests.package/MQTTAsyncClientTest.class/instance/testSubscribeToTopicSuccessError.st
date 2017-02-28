tests
testSubscribeToTopicSuccessError
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open;
		subscribeToTopic: self topic
		success: [ self addToResults: #subscribe ]
		error: [ :exception | self addToResults: exception. exception pass ].
	self assertSemaphore: 3.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(cycle subscribe cycle cycle).
	self assert: client subscriptions size equals: 1.
	self assert: (client subscriptions first endsWith: self topic).
	self assert: client isConnected.
	self deny: client isActive.