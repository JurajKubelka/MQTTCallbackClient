tests
testDoNotHold
	self deny: (MQTTCommand new hold; doNotHold; isOnHold)