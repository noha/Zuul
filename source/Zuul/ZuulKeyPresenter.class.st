Class {
	#name : #ZuulKeyPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'input'
	],
	#category : #Zuul
}

{ #category : #specs }
ZuulKeyPresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		"add: #label;"
		add: #input;
		yourself
]

{ #category : #initialization }
ZuulKeyPresenter >> initializeDialogWindow: aWindow [

	super initializeDialogWindow: aWindow.
	aWindow centered
]

{ #category : #initialization }
ZuulKeyPresenter >> initializeWidgets [ 
	"label := self newLabel label: 'Insert the key to unlock'"
	input := self newTextInput
		autoAccept: true
]

{ #category : #accessing }
ZuulKeyPresenter >> text [
	^  input text
]
