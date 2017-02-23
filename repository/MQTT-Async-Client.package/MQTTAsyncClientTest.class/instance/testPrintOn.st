tests
testPrintOn
	self assert: (String streamContents: [ :stream | MQTTAsyncClient new printOn: stream ]) notEmpty.