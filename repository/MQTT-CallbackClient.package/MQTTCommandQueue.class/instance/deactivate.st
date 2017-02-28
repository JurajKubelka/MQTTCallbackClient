initialize-release
deactivate
	^ mutex critical: [ | oldProcess |
		permission := false.
		oldProcess := process.
		process := nil.
		oldProcess ]