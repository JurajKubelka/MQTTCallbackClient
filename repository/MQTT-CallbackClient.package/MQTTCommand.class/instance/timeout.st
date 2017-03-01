accessing
timeout
	^ timeout ifNil: [ timeout := self defaultTimeout ]