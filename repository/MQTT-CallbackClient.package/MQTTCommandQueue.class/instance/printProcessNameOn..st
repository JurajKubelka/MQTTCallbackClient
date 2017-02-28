printing
printProcessNameOn: aStream
	aStream nextPutAll: 'MQTT Command process for '.
	aStream nextPutAll: (mqttClient ifNotNil: #clientId ifNil: '<nil client>').