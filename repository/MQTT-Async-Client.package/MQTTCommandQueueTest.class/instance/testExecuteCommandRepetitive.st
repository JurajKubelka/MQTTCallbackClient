tests
testExecuteCommandRepetitive
	command := MQTTCommand new.
	command 
		responseBlock: [ :packet | results add: #response ];
		errorBlock: [ results add: #error ];
		beRepetitive.
	queue basicAdd: command.
	queue executeCommand.
	self assert: queue size equals: 1.
	self assert: results asArray equals: #(response).