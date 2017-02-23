public
subscribeToTopic: topicFilter success: responseBlock error: errorBlock
	"Subscribe to topicFilter at my default QoS.
	The server/broker will send us messages matching topicFilter."
	self 
		subscribeToTopic: topicFilter 
		qos: mqttClient qualityOfService 
		success: responseBlock 
		error: errorBlock