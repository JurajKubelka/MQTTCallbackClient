tests
testBeSingleExecution2
	self deny: (MQTTCommand new beRepetitive; beSingleExecution; isRepetitive)