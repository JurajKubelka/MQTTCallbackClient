running
tearDown
	client ifNotNil: [ :aClient | 
		aClient log: 'Tear down test case ', self className asString, '>>#', self selector asString ].
	client ifNotNil: #basicClose.
	super tearDown.