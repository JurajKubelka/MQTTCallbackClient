*MQTT-CallbackClient
changeTimeout: seconds
	self timeout = seconds ifTrue: [ ^ self ].
	self timeout: seconds.
	connection ifNotNil: [ :instance | instance changeTimeout: seconds ]