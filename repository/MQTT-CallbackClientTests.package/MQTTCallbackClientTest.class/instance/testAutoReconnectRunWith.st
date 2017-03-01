tests
testAutoReconnectRunWith
	| numberOfCycles |
	numberOfCycles := 0.
	client 
		afterEachCycleBlock: [ :queue | 
			self addToResultsAndSignal: #cycle.
			numberOfCycles := numberOfCycles + 1. 
			numberOfCycles = 3 ifTrue: [ client
				close: [ self addToResults: #close ] 
				error: [ :exception | self addToResults: exception ] ] ];
		reopen: [ :response :mqttClient :command | self addToResults: #reconnect ]
			error: [ :exception :mqttClient :command | 
				self addToResults: #reconnectionError. self addToResults: exception ]
			suspend: [ :duration :time :command | 
				self addToResults: #suspend.
				duration > 0 seconds ifTrue: [
					self logTestCase.
					ShouldNotImplement signal: 'Should not happen' ] ];
		runWith: [ :packet | packet isApplicationMessage ] 
			response: [ :response :mqttClient :command | self addToResults: #runWith. ]
			error: [ :exception | self addToResults: #errorRunWith. self addToResults: exception className ].
	self assertSemaphore: 5.
	self 
		assert: results asArray 
		equals: #(errorRunWith ConnectionClosed cycle suspend reconnect cycle cycle cycle close cycle).
	self assert: client size equals: 1.
	self deny: client isConnected.
	self deny: client isActive.