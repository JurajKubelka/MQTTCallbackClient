accessing
delayDuration
	| current |
	current := delayDuration.
	delayDuration := (delayDuration + 1 second) * 3.
	maxDelayDuration ifNotNil: [ delayDuration := delayDuration min: maxDelayDuration ].
	^ current
	