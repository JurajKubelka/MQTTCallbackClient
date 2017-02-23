public - debugging
readSuchThat: conditionBlock
	self 
		readSuchThat: conditionBlock 
		success: [ :packet | self log: 'message received ', packet contents asString ] 
		error: [ :exception | 
			self log: 'message not received, exception ', exception printString.
			exception pass ]