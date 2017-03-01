private
nextOrNil
	"Return next command or if the queue is empty."
	^ mutex critical: [
		(queue linkAt: 1 ifAbsent: nil)
			ifNotNil: [ :link | link value ] ]