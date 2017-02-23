initialize-release
open: responseBlock error: errorBlock
	"Open connection with a server/broker.
	Auto-reconnect if the connection lost."
	self addFirst: (MQTTCommand new
		actionBlock: [ :client :command | client open ];
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		yourself)