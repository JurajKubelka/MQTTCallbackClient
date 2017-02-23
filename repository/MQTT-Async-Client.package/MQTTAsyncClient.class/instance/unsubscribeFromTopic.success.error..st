public
unsubscribeFromTopic: topicFilter success: responseBlock error: errorBlock
	"Unsubscribe from topicFilter.
	The server/broker will no longer send us messages matching topicFilter."
	queue add: (MQTTCommand new
		actionBlock: [ :client :command | client unsubscribeFromTopic: topicFilter ];
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		yourself)