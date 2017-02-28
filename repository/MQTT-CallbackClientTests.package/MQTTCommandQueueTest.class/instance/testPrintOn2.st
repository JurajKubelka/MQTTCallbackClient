tests
testPrintOn2
	self assert: (String streamContents: [ :stream | MQTTCommandQueue printOn: stream ]) notEmpty.