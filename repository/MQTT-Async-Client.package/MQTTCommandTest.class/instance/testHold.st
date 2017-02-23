tests
testHold
	self assert: (MQTTCommand new hold; isOnHold)