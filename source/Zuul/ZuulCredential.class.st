Class {
	#name : #ZuulCredential,
	#superclass : #Object,
	#instVars : [
		'title',
		'user',
		'passphrase',
		'id'
	],
	#category : #Zuul
}

{ #category : #comparing }
ZuulCredential >> <= aCredential [
	^  title asLowercase <= aCredential title asLowercase 
]

{ #category : #'as yet unclassified' }
ZuulCredential >> displayTitle [
	^ title ifEmpty: [ 
		'New Entry' ]
]

{ #category : #accessing }
ZuulCredential >> id [
	^ id
]

{ #category : #initialization }
ZuulCredential >> initialize [ 
	super initialize.
	id := UUID new asString36.
	title := ''.
	user := ''.
	passphrase := ''.
]

{ #category : #accessing }
ZuulCredential >> passphrase [
	^ passphrase
]

{ #category : #accessing }
ZuulCredential >> passphrase: anObject [
	passphrase := anObject
]

{ #category : #accessing }
ZuulCredential >> title [
	^ title
]

{ #category : #accessing }
ZuulCredential >> title: anObject [
	title := anObject
]

{ #category : #accessing }
ZuulCredential >> user [
	^ user
]

{ #category : #accessing }
ZuulCredential >> user: anObject [
	user := anObject
]
