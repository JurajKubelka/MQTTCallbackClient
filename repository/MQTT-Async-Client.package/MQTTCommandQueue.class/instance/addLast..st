adding
addLast: aMQTTCommand 
	^ mutex critical: [ | item |
		item := queue addLast: aMQTTCommand.
		self activate.
		item value ]