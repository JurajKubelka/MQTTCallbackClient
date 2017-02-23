tests
testRunWithResponseError
	| numberOfMessages |
	numberOfMessages := 0.
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		open;
		subscribeToTopic: self topic;
		sendMessage: self bytes toTopic: self topic;
		runWith: [ :packet | packet isApplicationMessage ] 
		response: [ :response :mqttClient :command | 
			self addToResults: #runWith.
			numberOfMessages := numberOfMessages + 1.
			numberOfMessages = 2 ifTrue: [ command beSingleExecution ] ]
		error: [ :exception | self addToResults: exception. exception pass ];
		sendMessage: self bytes toTopic: self topic.
	self assertSemaphore: 7.
	self assert: client size equals: 0.
	self assert: results asArray equals: #(cycle cycle cycle runWith cycle cycle runWith cycle cycle).
	self assert: client isConnected.
	self deny: client isActive.