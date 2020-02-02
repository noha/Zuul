Class {
	#name : #ZuulUI,
	#superclass : #SpPresenter,
	#instVars : [
		'toolbar',
		'list',
		'credential'
	],
	#category : #Zuul
}

{ #category : #specs }
ZuulUI class >> defaultSpec [
    ^ SpBoxLayout newVertical
       add: #toolbar withConstraints: [ :constraints | constraints height: self toolbarHeight ];
       add: (SpBoxLayout newHorizontal 
			add: #list;
			add: #credential);
       yourself
]

{ #category : #examples }
ZuulUI class >> open [
	<example>
	^ (self newApplication: ZuulApplication new) openWithSpec
]

{ #category : #accessing }
ZuulUI >> addCredentials [
	credential := ZuulCredential new.
	list model add: credential.
	list selectItem: credential 
]

{ #category : #'as yet unclassified' }
ZuulUI >> enableList [
	list items: self application allCredentials.
	list selectIndex: 1.
	list enable.
	credential show.
	(toolbar itemNamed: 'Add') enable.
	(toolbar itemNamed: 'Remove') enable
	
]

{ #category : #TOREMOVE }
ZuulUI >> initialExtent [

	| fontWidth rowHeight |
	fontWidth := (StandardFonts defaultFont widthOfString: 'M').
	rowHeight := self class inputTextHeight.

	^ (70@20) * (fontWidth @ rowHeight)
	
]

{ #category : #initialization }
ZuulUI >> initializeWidgets [
	toolbar := self toolbar.
	list := self newList.
	list disable.
	list display: #displayTitle.
	credential := self instantiate: ZuulCredentialsPresenter.
	credential onSaveDo: [ :c |
		list items: list items sorted ].
	list transmitTo: credential.
	credential hide.
	

]

{ #category : #'as yet unclassified' }
ZuulUI >> inquireCryptoKey [
	| search modal |
	search := ZuulKeyPresenter  newApplication: self application.
	modal := search openModalWithSpec.
	modal isOk ifTrue: [  
		self application setCryptoKey: modal presenter text ].
	self enableList
]

{ #category : #'as yet unclassified' }
ZuulUI >> removeCredentials [
	self application removeCredentials: list selection selectedItem.
	list items: (list items copyWithout: list selection selectedItem)
]

{ #category : #accessing }
ZuulUI >> toolbar [ 
	| aToolbar |
	aToolbar := self newToolBar 
		addItem: (SpToolBarButton new
			label: 'Key';
			icon: (self iconNamed: #lock);
			help: 'Set crypro key';
			action: [ self inquireCryptoKey ];
			yourself);
		addItem: (SpToolBarButton new
			label: 'Add';
			icon: (self iconNamed: #add);
			help: 'Add new credentials';
			action: [ self addCredentials ];
			disable;
			yourself);
		addItem: (SpToolBarButton new
			label: 'Remove';
			icon: (self iconNamed: #remove);
			help: 'Remove selected credentials';
			action: [ self removeCredentials ];
			disable;
			yourself).
	^ aToolbar
]
