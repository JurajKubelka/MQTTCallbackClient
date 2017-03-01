private
signalSemaphore
	semaphore 
		ifNotNil: #signal
		ifNil: [ self 
			crTrace: 'CRITICAL ERROR: semaphore is nil for ';
			trace: self className;
			trace: '>>#';
			traceCr: self selector ]