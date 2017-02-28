running
setUp
	super setUp.
	semaphore := Semaphore new. 
	results := OrderedCollection new.
	client := self newClient.
	client clientId: 'Test Client ', 999 atRandom printString.
