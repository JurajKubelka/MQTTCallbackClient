public - debugging
ping
	self 
		ping: [ self log: 'successful ping' ] 
		error: [ :exception | 
			self log: 'cannot ping, exception ', exception printString.
			exception pass ]