private
reconnectOn: aMQTTClient
	| response |
	self wait: aMQTTClient.
	self changeTimeoutOn: aMQTTClient.
	response := self actionOn: aMQTTClient.
	aMQTTClient isReallyConnected ifFalse: [ ConnectionClosed signal ].
	self resetDelayDuration.
	self response: response client: aMQTTClient 