executing
executeOn: aMQTTClient
	[
		self reconnectOn: aMQTTClient.
	]	on: NetworkError, PrimitiveFailed
		do: [ :exception | 
			self error: exception client: aMQTTClient.
			self executeOn: aMQTTClient ]