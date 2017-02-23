private
informSuspendingReconnection: duration
	| time |
	time := DateAndTime now + duration.
	suspendBlock cull: duration cull: time cull: self