public - debugging
sendMessage: bytes toTopic: topicString

	self 
		sendMessage: bytes 
		toTopic: topicString 
		success: [ self log: 'message sent to ', topicString asString ] 
		error: [ :exception | 
			self log: 
				'cannot send message to ', topicString asString, 
				', exception ', exception printString.
			exception pass ]