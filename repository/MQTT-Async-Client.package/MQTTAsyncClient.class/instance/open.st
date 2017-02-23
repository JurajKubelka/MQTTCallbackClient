initialize-release
open
	self 
		open: [ self log: 'established connection' ] 
		error: [ :exception | 
			self log: 'cannot establish connection, exception ', exception printString.
			exception pass ]