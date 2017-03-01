tests
testExecuteCommandNoRepetitive2
	command := MQTTCommand new.
	command 
		responseBlock: [ :packet | results add: #response ];
		errorBlock: [ results add: #error ].
	queue basicAdd: command.
	queue executeCommand.
	self assert: queue size equals: 0.
	self assert: results asArray equals: #(response).