public
runWith: conditionBlock response: responseBlock error: errorBlock
	"Enter a loop reading messages, ignoring ConnectionTimedOut.
	The conditionBlock is evaluated for each incoming message.
	If it returns true, responseBlock is evaluated.
	ConnectionClosed can be signalled from responseBlock to exit the loop.
	Connection is kept."
	queue add: (MQTTCommand new
		actionBlock: [ :client :command | client readSuchThat: conditionBlock ];
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		timeout: 0.1;
		beRepetitive;
		yourself)