private
executeCommand
	| command shouldDeactivate |
	command := self nextOrNil.
	command ifNil: [ ^ self deactivate ].
	shouldDeactivate := false.
	[ [ command executeOn: self mqttClient.
		self isConnected ifFalse: [ shouldDeactivate := true ] ]	
		on: NetworkError, PrimitiveFailed
		do: [ :exception | 
			command error: exception client: self mqttClient.
			shouldDeactivate := self prepareReopen ].
	] ensure: [ 
		command isOnHold ifFalse: [ 
			self remove: command.
			command isRepetitive ifTrue: [ self addLast: command ] ].
		command doNotHold ].
	shouldDeactivate ifTrue: [ self deactivate ].