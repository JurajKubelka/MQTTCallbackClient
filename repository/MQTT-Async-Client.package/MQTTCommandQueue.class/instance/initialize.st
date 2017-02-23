initialization
initialize
	super initialize.
	mutex := Mutex new.
	queue := LinkedList new.
	permission := true.
	afterEachCycleBlock := [ :instance | instance ].
	