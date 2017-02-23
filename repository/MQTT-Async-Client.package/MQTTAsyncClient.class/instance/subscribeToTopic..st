public - debugging
subscribeToTopic: topicFilter
	^ self 
		subscribeToTopic: topicFilter 
		success: [ self log: 'subscribed to topic ', topicFilter asString ] 
		error: [ :exception | 
				self log: 
					'cannot subscribe to topic ', topicFilter asString, 
					', exception ', exception printString.
			exception pass ]
