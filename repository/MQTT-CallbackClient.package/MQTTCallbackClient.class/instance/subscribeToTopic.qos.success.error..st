public
subscribeToTopic: topicFilter qos: qos success: responseBlock error: errorBlock
	"Subscribe to topicFilter at qos.
	The server/broker will send us messages matching topicFilter."
	queue add: (MQTTCommand new
		actionBlock: [ :client :command | 
			(client subscriptions includes: topicFilter) ifFalse: [ 
				client subscribeToTopic: topicFilter qos: qos ] ];
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		yourself)