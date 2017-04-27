tests
testExecuteCommandErrorSignal
	"There are some issues with the MQTT protocol. For that reasone we catch all errors"
	<expectedFailure>
	command actionBlock: [ results add: #action. Error signal ].
	queue basicAdd: command.
	self should: [ queue executeCommand ] raise: Error.
	self assert: queue size equals: 0.
	self assert: results asArray equals: #(action).