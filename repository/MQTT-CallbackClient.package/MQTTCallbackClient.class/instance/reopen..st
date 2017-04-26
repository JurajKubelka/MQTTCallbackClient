initialize-release
reopen: aMQTTCommand
	"(Re-)Open connection with a server/broker.
	The command is called if a connection with the server/broker is lost."
	self maxReconnectionDelay ifNotNil: [ :delay | aMQTTCommand maxDelayDuration: delay ].
	^ queue reopen: aMQTTCommand