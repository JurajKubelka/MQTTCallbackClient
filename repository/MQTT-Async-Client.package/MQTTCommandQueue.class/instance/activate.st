initialize-release
activate
	"Initialize a delivery process."
	^ mutex critical: [ 
			permission := true.
			self isInactive ifTrue: [ self activateProcess ].
			process ]