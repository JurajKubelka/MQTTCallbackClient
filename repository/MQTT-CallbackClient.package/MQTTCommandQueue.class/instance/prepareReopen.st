private
prepareReopen
	"Returns true, if reopen command is not present. False otherwise."
	^ reopen 
		ifNil: [ true ]
		ifNotNil: [ :command | 
			self addFirst: command. false ]