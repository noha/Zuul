Class {
	#name : #ZuulUI,
	#superclass : #SpPresenter,
	#instVars : [
		'main'
	],
	#category : #Zuul
}

{ #category : #specs }
ZuulUI class >> defaultSpec [
    ^ SpBoxLayout newVertical
       " add: #menu withConstraints: [ :constraints | constraints height: self toolbarHeight ];"
        add: #main;
        yourself
]

{ #category : #examples }
ZuulUI class >> open [
	<example>
	^ (self newApplication: ZuulApplication new) openWithSpec
]

{ #category : #initialization }
ZuulUI >> initializeWidgets [
	main := self instantiate: ZuulTable
]
