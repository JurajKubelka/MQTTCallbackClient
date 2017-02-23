initialize-release
maybeConnect
	"Returns true if connected, false otherwise."
	self isConnected ifTrue: [ ^ true ].
	self reopen ifNotNil: [ :command | command executeOn: self mqttClient ].
	^ self isConnected