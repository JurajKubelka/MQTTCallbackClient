gt-inspector-extension
gtInspectorSubscriptionsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite fastList
		title: 'Subscriptions';
		display: [ mqttClient subscriptions ];
		act: [ :presentation | presentation update ] 
			iconName: #glamorousRefresh 
			entitled: 'Update Subscription List';
		selectionAct: [ :presentation | | topic |
				topic := presentation selection.
				self 
					unsubscribeFromTopic: topic
					success: [ 
						self inform: 'successfully unsubscribed from ', topic.
						presentation update ]
					error: [ :exception | 
						self inform: 'cannot unsubscribed from ', topic, 
							', exception ', exception printString.
						presentation update ] ]
			iconName: #glamorousRemove
			entitled: 'Unsubscribe';
		yourself