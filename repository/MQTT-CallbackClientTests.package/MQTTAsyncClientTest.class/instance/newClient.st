instance creation
newClient
	^ MQTTCallbackClient new
		host: NetNameResolver loopBackName;
		port: 1883;
		yourself.