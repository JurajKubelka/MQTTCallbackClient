tests
testSendMessageToTopicSuccessError
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open;
		sendMessage: self bytes
		toTopic: self topic
		success: [ self addToResults: #send ]
		error: [ :exception | self addToResults: exception. exception pass ].
	self assertSemaphore: 3.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(cycle send cycle cycle).
	self assert: client isConnected.
	self deny: client isActive.