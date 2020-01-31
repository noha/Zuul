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

{ #category : #accessing }
ZuulCredential >> id [
	^ id
]

{ #category : #initialization }
ZuulCredential >> initialize [ 
	super initialize.
	id := UUID new asString36
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
