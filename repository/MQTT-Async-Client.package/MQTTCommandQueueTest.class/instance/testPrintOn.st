tests
testPrintOn
	queue basicAdd: command.
	self assert: (String streamContents: [ :stream | queue printOn: stream ]) notEmpty.