testing
isConnected
	^ self mqttClient isNotNil and: [ self mqttClient isReallyConnected ]