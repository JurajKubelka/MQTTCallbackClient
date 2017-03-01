input/output
logTestCase
	| log |
	log := 'Running ', self className asString, '>>#', self selector asString.
	client 
		ifNotNil: [ :aClient | aClient log: log ]
		ifNil: [ self crTrace: log ]