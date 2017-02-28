private
activateProcess
	process := [ [ self hasPermission ] whileTrue: [ self executionCycle ] ]
		forkAt: Processor userBackgroundPriority
		named: self printProcessName