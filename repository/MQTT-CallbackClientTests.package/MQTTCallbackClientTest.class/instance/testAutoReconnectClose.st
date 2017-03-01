tests
testAutoReconnectClose
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
		close: [ self addToResults: #close ] 
		error: [ :exception | self addToResults: exception ].
	self assertSemaphore: 2.
	self 
		assert: results asArray 
		equals: #(open cycle close cycle).
	self assert: client size equals: 0.
	self deny: client isConnected.
	self deny: client isActive.