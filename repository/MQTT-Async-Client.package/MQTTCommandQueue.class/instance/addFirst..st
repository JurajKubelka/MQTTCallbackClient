adding
addFirst: aMQTTCommand 
	^ mutex critical: [ | item |
		item := queue addFirst: aMQTTCommand.
		self activate.
		item value ]