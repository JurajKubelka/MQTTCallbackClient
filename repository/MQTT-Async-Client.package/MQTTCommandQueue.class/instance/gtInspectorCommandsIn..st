gt-inspector-extension
gtInspectorCommandsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite fastTable
			title: 'Commands';
			display: [ queue ];
			act: [ :presentation | presentation update ] 
				iconName: #glamorousRefresh 
				entitled: 'Update Command List';
			selectionAct: [ :presentation | | command |
					command := presentation selection.
					command beSingleExecution.
					presentation update. ]
			iconName: #glamorousRemove
			entitled: 'As Single Execution Command';
			column: 'Repetitive' evaluated: [ :each | each isRepetitive printString ] width: 70;
			column: 'Action' evaluated: [ :each | each actionBlock printString ];
			column: 'Response' evaluated: [ :each | each responseBlock printString ];
			column: 'Error' evaluated: [ :each | each errorBlock printString ];
			yourself