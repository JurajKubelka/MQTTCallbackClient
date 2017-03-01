unit-testing
basicClose
	"It is used for testing in order to close the MQTT client during tearDown phase."
	^ mqttClient ifNotNil: #close