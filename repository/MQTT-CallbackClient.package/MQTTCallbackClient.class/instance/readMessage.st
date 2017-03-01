public - debugging
readMessage
	self 
		readMessage: [ :packet | self log: 'message received ', packet contents asString ] 
		error: [ :exception | 
			self log: 'message not received, exception ', exception printString.
			exception pass ]