accessing
delayDuration
	| current |
	current := delayDuration.
	delayDuration := (delayDuration + 1 second) * 3.
	^ current
	