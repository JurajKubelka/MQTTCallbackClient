running
setUp
	super setUp.
	semaphore := Semaphore new. 
	results := OrderedCollection new.
	client := self newClient.
	client clientId: 'Test Client ', 999 atRandom printString.
	client log: 'Setup test case ', self className asString, '>>#', self selector asString.