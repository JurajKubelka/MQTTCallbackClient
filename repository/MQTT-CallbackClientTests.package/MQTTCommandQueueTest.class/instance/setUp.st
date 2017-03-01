running
setUp
	super setUp.
	results := OrderedCollection new.
	queue := MQTTCommandQueue new.
	mqttClient := MQTTMockClient new.
	queue mqttClient: mqttClient.
	command := MQTTCommand new.
	command 
		actionBlock: [ :client | results add: #action. client action value ];
		responseBlock: [ results add: #response ];
		errorBlock: [ :exception | results add: #error ]