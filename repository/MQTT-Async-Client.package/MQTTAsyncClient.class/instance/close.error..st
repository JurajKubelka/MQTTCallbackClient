initialize-release
close: responseBlock error: errorBlock
	"Open connection with a server/broker."
	queue add: (MQTTCommand new
		actionBlock: [ :client :command | client close ];
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		yourself)