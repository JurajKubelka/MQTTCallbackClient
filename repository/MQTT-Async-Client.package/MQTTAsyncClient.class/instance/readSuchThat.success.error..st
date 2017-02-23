public
readSuchThat: conditionBlock success: responseBlock error: errorBlock
	"Read a message while handling the necessary QoS flows.
	Only application messages for which block evaluates to true will be returned.
	Might fail with ConnectionTimedOut."
	queue add: (MQTTCommand new
		actionBlock: [ :client :command | client readSuchThat: conditionBlock ];
		responseBlock: responseBlock;
		errorBlock: errorBlock;
		yourself)