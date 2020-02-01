Class {
	#name : #ZuulTablePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'table'
	],
	#category : #Zuul
}

{ #category : #specs }
ZuulTablePresenter class >> defaultSpec [
    ^ SpBoxLayout newVertical
        add: #table;
        yourself
]

{ #category : #adding }
ZuulTablePresenter >> addCredentials: aCredentials [
	table model add: aCredentials 
]

{ #category : #initialization }
ZuulTablePresenter >> initializeWidgets [
	table := self newTable.
	table
		addColumn:
			((SpStringTableColumn title: 'Title' evaluated: #title) 
				width: 250;
				beEditable;
				onAcceptEdition: [ :credentials :value | 
					credentials title: value.
					self application store: credentials ];
				yourself);
		addColumn:
			((SpStringTableColumn title: 'User' evaluated: #user) 
				width: 250;
				beEditable;
				onAcceptEdition: [ :credentials :value | 
					credentials user: value.
					self application store: credentials ];
				yourself);
		addColumn:
			((SpStringTableColumn title: 'Passphrase' evaluated: #passphrase) 
				width: 250;
				beEditable;
				onAcceptEdition: [ :credentials :value | 
					credentials passphrase: value.
					self application store: credentials ];
				yourself);
		activatesOnSingleClick;
		whenActivatedDo: [ :selection |
			selection widget beEditable.
			 ]
		"whenSelectionChangedDo: [ :ev | 
			content item: ev selectedItem ];
		items: self allFocusedTasks;
		beResizable.
	content := self instantiate: BorgPillarPresenter "
]
