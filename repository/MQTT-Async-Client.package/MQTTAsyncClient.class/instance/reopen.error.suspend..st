initialize-release
reopen: responseBlock error: errorBlock suspend: suspendBlock 
	"(Re-)Open connection with a server/broker.
	The command is called if a connection with the server/broker is lost.
	Waits until connection is established."
	self reopen: (MQTTAutoReconnect new
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		suspendBlock: suspendBlock;
		yourself)