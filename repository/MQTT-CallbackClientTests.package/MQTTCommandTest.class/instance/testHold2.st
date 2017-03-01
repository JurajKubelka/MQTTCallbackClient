tests
testHold2
	self assert: (MQTTCommand new doNotHold; hold; isOnHold)