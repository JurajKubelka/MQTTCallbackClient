public
now
	"re-connect now"
	delay ifNotNil: [ :aDelay | aDelay delaySemaphore signal. aDelay unschedule. ]