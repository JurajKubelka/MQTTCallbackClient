*MQTT-CallbackClient
isReallyConnected
	^ connection notNil and: [ connection isConnected ]