printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' [';
		print: self size;
		nextPutAll: (' command' asPluralBasedOn: self size);
		nextPutAll: ', ';
		nextPutAll: (self isActive ifTrue: [ 'active' ] ifFalse: [ 'inactive' ]);
		nextPutAll: ', ';
		nextPutAll: (self isConnected ifTrue: [ 'connected' ] ifFalse: [ 'disconnected' ]);
		nextPut: $]