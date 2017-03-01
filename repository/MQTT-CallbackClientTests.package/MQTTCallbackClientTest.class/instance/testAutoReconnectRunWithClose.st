tests
testAutoReconnectRunWithClose
	| numberOfMessages |
	numberOfMessages := 0.
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		reopen: [ :response :mqttClient :command | self addToResults: #reconnect ]
			error: [ :exception :mqttClient :command | 
				self addToResults: #reconnectionError. self addToResults: exception ]
			suspend: [ :duration :time :command | 
				self addToResults: #suspend.
				duration > 0 seconds ifTrue: [
					self logTestCase.
					ShouldNotImplement signal: 'Should not happen' ] ];
		open: [ self addToResults: #open. ] 
			error: [ :exception | self addToResults: exception. exception pass ];
		runWith: [ :packet | packet isApplicationMessage ] 
			response: [ :response :mqttClient :command | self addToResults: #runWith. ]
			error: [ :exception | self addToResults: #errorRunWith. self addToResults: exception. exception pass ];
		close: [ self addToResults: #close ] 
			error: [ :exception | self addToResults: exception ].
	self assertSemaphore: 3.
	self 
		assert: results asArray 
		equals: #(open cycle cycle close cycle).
	self assert: client size equals: 1.
	self deny: client isConnected.
	self deny: client isActive.