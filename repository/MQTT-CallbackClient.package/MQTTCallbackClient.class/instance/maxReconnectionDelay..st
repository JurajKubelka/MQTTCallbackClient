accessing
maxReconnectionDelay: aDurationOrNil
	"Set maximum delay between two network connection attempts.
	By setting nil, there is no time limit."
	maxReconnectionDelay := aDurationOrNil.
	queue reopen ifNotNil: [ :command | command maxDelayDuration: aDurationOrNil ].