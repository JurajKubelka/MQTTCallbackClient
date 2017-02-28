public
ping: responseBlock error: errorBlock
	"Send a ping request and wait for a ping reply."
	queue add: (MQTTCommand new
		actionBlock: [ :client :command | client ping ];
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		yourself)