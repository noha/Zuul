Class {
	#name : #ZuulUI,
	#superclass : #SpPresenter,
	#instVars : [
		'main',
		'toolbar'
	],
	#category : #Zuul
}

{ #category : #specs }
ZuulUI class >> defaultSpec [
    ^ SpBoxLayout newVertical
       add: #toolbar withConstraints: [ :constraints | constraints height: self toolbarHeight ];
       add: #main;
       yourself
]

{ #category : #examples }
ZuulUI class >> open [
	<example>
	^ (self newApplication: ZuulApplication new) openWithSpec
]

{ #category : #accessing }
ZuulUI >> addCredentials [
	main addCredentials: ZuulCredential new
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
	main := self instantiate: ZuulTable
]

{ #category : #accessing }
ZuulUI >> toolbar [ 
	| aToolbar |
	aToolbar := self newToolBar 
		addItem: (SpToolBarButton new
			label: 'Add';
			icon: (self iconNamed: #add);
			help: 'Add new credentials';
			action: [ self addCredentials ];
			yourself).
	^ aToolbar
]
