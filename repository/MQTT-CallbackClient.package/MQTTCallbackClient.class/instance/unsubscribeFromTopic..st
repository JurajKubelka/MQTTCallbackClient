public - debugging
unsubscribeFromTopic: topicFilter
	self 
		unsubscribeFromTopic: topicFilter 
		success: [ self log: 'unsubscribed from ', topicFilter asString ] 
		error: [ :exception | 
			self log: 
				'cannot unsubscribe from ', topicFilter asString, 
				', exception ', exception printString.
			exception pass ]
