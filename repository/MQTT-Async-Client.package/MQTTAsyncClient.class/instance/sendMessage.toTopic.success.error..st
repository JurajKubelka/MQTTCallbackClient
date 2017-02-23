public
sendMessage: bytes toTopic: topicString success: responseBlock error: errorBlock
	"Send a message consisting of bytes to topicString while handling QoS flows.
	Might fail with ConnectionTimedOut."
	queue add: (MQTTCommand new
		actionBlock: [ :client :command | client sendMessage: bytes toTopic: topicString ];
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		yourself)