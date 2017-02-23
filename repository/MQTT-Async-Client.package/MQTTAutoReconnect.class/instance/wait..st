waiting
wait: aMQTTClient
	"wait for the next re-connection intent"
	| duration |
	duration := self delayDuration.
	delay := duration asDelay.
	aMQTTClient log: 'Reconnecting in ', duration printString.
	self informSuspendingReconnection: duration.
	delay wait.
	delay := nil.