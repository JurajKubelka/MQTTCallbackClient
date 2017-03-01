running
setUp
	super setUp.
	client := MQTTMockClient new.
	results := OrderedCollection new.
	command := self newCommand
		actionBlock: [ :mqttClient :aCommand | results add: #action ];
		responseBlock: [ :response :mqttClient :aCommand | results add: #response ];
		errorBlock: [ :exception :mqttClient :aCommand | 
			results
				add: #error;
				add: exception className ]