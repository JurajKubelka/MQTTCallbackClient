initialization
initialize
	super initialize.
	actionBlock := [ :mqttClient :command | mqttClient open ].
	suspendBlock := [ :duration :time :command | ].
	delayDuration := 0 seconds.