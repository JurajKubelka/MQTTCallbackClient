tests
testAdd
	queue add: command.
	self assert: queue size equals: 1.