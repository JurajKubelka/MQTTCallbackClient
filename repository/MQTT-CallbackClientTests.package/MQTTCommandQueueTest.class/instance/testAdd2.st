tests
testAdd2
	queue add: command.
	queue add: command.
	self assert: queue size equals: 2.