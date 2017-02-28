public - debugging
runWith: conditionBlock
	self 
		runWith: conditionBlock 
		response: [ :packet | self log: 'message received ', packet contents asString ] 
		error: [ :exception | 
			self log: 'message not received, exception ', exception printString.
			exception pass ]