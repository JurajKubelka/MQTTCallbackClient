tests
testPrintOn
	self assert: (String streamContents: [ :stream | MQTTCallbackClient new printOn: stream ]) notEmpty.