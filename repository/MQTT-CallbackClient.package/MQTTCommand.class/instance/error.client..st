error handling
error: exception client: aMQTTClient
	^ self errorBlock cull: exception cull: aMQTTClient cull: self