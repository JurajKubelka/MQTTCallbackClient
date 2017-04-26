tests
testAutoReconnect3
	"Check that max reconnection delay is correctly set."
	client 
		afterEachCycleBlock: [ :queue | self addToResultsAndSignal: #cycle ];
		reopen: [ :response :mqttClient :command | self addToResults: #reconnect ]
		error: [ :exception :mqttClient :command | 
			self addToResults: #reconnectionError. self addToResults: exception ]
		suspend: [ :duration :time :command | 
			self addToResults: #suspend.
			self addToResults: command maxDelayDuration.
			duration > 0 seconds ifTrue: [
				self logTestCase.
				ShouldNotImplement signal: 'Should not happen' ] ];
		maxReconnectionDelay: 21 seconds.
	self assertSemaphore: 0.
	self deny: client isConnected.
	self deny: client isActive.
	client
		ping: [ self addToResults: #ping ] 
		error: [ :exception :mqttClient :command |  
			self addToResults: #pingError. self addToResults: exception className ].
	self assertSemaphore: 3.
	self assert: client size equals: 0.
	self 
		assert: results asArray 
		equals: { #pingError. 'ConnectionClosed'. #cycle. #suspend. 21 seconds. #reconnect. #cycle. #cycle }.
	self assert: client isConnected.
	self deny: client isActive.