initialization
initialize
	super initialize.
	actionBlock := [ :mqttClient :command | ].
	responseBlock := [ :response :mqttClient :command | ].
	errorBlock := [ :exception :mqttClient :command | ].
	isRepetitive := false.
	isOnHold := false.