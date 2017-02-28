asserting
assertSemaphore
	self 
		deny: (semaphore waitTimeoutMSecs: self timeoutMSecs) 
		description: 'Timeout while wainting for semaphore.'