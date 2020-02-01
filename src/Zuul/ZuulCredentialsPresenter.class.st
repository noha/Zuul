Class {
	#name : #ZuulCredentialsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'title',
		'user',
		'passphrase',
		'credential',
		'titleLabel',
		'passphraseLabel',
		'userLabel',
		'okButton',
		'saveBlock',
		'userCopy',
		'passphraseCopy'
	],
	#category : #Zuul
}

{ #category : #specs }
ZuulCredentialsPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		beNotHomogeneous;
		add: #titleLabel expand: false fill: false padding: 15;
		add: #title expand: false fill: false padding: 15;
		add: #userLabel expand: false fill: false padding: 15;
		add: (SpBoxLayout newHorizontal 
			add: #user;
			add: #userCopy expand: false) expand: false fill: false padding: 15;
		add: #passphraseLabel expand: false fill: false padding: 15;
		add: (SpBoxLayout newHorizontal 
			add: #passphrase;
			add: #passphraseCopy expand: false) expand: false fill: false padding: 15;
		add: #okButton expand: false fill: false padding: 15;
		yourself
]

{ #category : #initialization }
ZuulCredentialsPresenter >> checkIfModified [
	| modified |
	modified := false.
	(credential title = title text) ifFalse: [ 
		modified := true ].
	(credential user = user text) ifFalse: [ 
		modified := true ].
	(credential passphrase = passphrase text) ifFalse: [ 
		modified := true ].
	modified 
		ifTrue: [ okButton enable ]
		ifFalse: [ okButton disable ]
]

{ #category : #initialization }
ZuulCredentialsPresenter >> defineInputPorts [
	^ { SpActionPort new action: [:obj | self setCredential: obj ]}
]

{ #category : #initialization }
ZuulCredentialsPresenter >> initializeWidgets [
	titleLabel := self newLabel label: 'Name'.
	title := self newTextInput
		placeholder: 'Enter a title';
		autoAccept: true;
		whenTextChangedDo: [ self checkIfModified ].
	userLabel := self newLabel label: 'Username'.
	user := self newTextInput
		placeholder: 'Enter the user/email/..';
		autoAccept: true;
		whenTextChangedDo: [  self checkIfModified ].
	userCopy := self newButton 
		icon: (self iconNamed: #smallCopy);
		action: [ Clipboard clipboardText: user text ].
	passphraseLabel := self newLabel label: 'Passphrase'.
	passphrase := self newTextInput bePassword
		placeholder: 'Enter the passphrase';
		autoAccept: true;
		whenTextChangedDo: [  self checkIfModified ].
	passphraseCopy := self newButton 
		icon: (self iconNamed: #smallCopy);
		action: [ Clipboard clipboardText: passphrase text ].
	okButton := self newButton 
		label: 'Save';
		icon: (self iconNamed: #smallOk);
		enabled: false;
		action: [ self save ]
]

{ #category : #enumerating }
ZuulCredentialsPresenter >> onSaveDo: aBlock [
	saveBlock := aBlock
]

{ #category : #accessing }
ZuulCredentialsPresenter >> passphrase [
	^ passphrase
]

{ #category : #accessing }
ZuulCredentialsPresenter >> passphrase: anObject [
	passphrase := anObject
]

{ #category : #'as yet unclassified' }
ZuulCredentialsPresenter >> save [
	credential 
		title: title text;
		user: user text;
		passphrase: passphrase text.
	self application storeCredential: credential.
	okButton disable.
	saveBlock ifNotNil: [ 
		saveBlock value: credential ]
	
]

{ #category : #'as yet unclassified' }
ZuulCredentialsPresenter >> setCredential: aZuulCredential [ 
	credential := aZuulCredential.
	title text: credential title.
	user text: credential user.
	passphrase text: credential passphrase
]

{ #category : #accessing }
ZuulCredentialsPresenter >> title [
	^ title
]

{ #category : #accessing }
ZuulCredentialsPresenter >> title: anObject [
	title := anObject
]

{ #category : #accessing }
ZuulCredentialsPresenter >> user [
	^ user
]

{ #category : #accessing }
ZuulCredentialsPresenter >> user: anObject [
	user := anObject
]
