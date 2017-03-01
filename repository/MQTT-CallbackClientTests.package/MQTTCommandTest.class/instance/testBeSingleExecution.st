tests
testBeSingleExecution
	self deny: (MQTTCommand new beSingleExecution; isRepetitive)