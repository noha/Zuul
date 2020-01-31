Class {
	#name : #ZuulTable,
	#superclass : #SpPresenter,
	#instVars : [
		'table'
	],
	#category : #Zuul
}

{ #category : #specs }
ZuulTable class >> defaultSpec [
    ^ SpBoxLayout newVertical
        add: #table;
        yourself
]

{ #category : #initialization }
ZuulTable >> initializeWidgets [
	table := self newTable.
	table
		addColumn:
			((SpStringTableColumn title: 'Title' evaluated: #title) 
				width: 350;
				yourself);
		addColumn:
			((SpStringTableColumn title: 'Passphrase' evaluated: #passphrase) 
				width: 100;
				yourself)
		"whenSelectionChangedDo: [ :ev | 
			content item: ev selectedItem ];
		items: self allFocusedTasks;
		beResizable.
	content := self instantiate: BorgPillarPresenter "
]
