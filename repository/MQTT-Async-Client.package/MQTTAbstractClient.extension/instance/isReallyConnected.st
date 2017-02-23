*MQTT-Async-Client
isReallyConnected
	^ connection notNil and: [ connection isConnected ]