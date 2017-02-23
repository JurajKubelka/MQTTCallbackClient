private
executionCycle
	[ 
		self executeCommand.
	] ensure: [
		self finalizedExecutionCycle ].