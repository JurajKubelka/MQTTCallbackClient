public
readMessage: responseBlock error: errorBlock
	"Read a message while handling the necessary QoS flows.
	Only application messages with an actual payload will be returned.
	Executes errorBlock on ConnectionTimedOut or another error.
	Executes responseBlock on success."
	self 
		readSuchThat: [ :packet | packet isApplicationMessage ] 
		success: responseBlock 
		error: errorBlock