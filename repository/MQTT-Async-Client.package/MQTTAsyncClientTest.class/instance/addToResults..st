private
addToResults: object
	^ results 
		ifNotNil: [ :collection | collection add: object ]
		ifNil: [ self 
			crTrace: 'CRITICAL ERROR: results is nil while adding ';
			trace: object;
			trace: ' for ';
			trace: self className;
			trace: '>>';
			traceCr: self selector ]