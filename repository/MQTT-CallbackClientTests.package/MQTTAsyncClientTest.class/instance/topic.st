accessing
topic
	^ topic ifNil: [ topic := 'test-case-', UUID new asString ]