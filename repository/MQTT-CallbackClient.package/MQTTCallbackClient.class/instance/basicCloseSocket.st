unit-testing
basicCloseSocket
	"Only for testing purpose"
	^ mqttClient ifNotNil: [ :client | 
		client connection ifNotNil: [ :connection | connection socket destroy ] ]