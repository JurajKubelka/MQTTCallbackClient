tests
testBeRepetitive2
	self assert: (MQTTCommand new beSingleExecution; beRepetitive; isRepetitive)