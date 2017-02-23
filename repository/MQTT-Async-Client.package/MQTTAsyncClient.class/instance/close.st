initialize-release
close
	self 
		close: [ self log: 'connection close' ] 
		error: [ :exception | self log: 'cannot close connection, exception ', exception printString ]