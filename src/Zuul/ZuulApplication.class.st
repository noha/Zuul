Class {
	#name : #ZuulApplication,
	#superclass : #SpApplication,
	#instVars : [
		'credentialsStore',
		'cryptoKey'
	],
	#classInstVars : [
		'instance'
	],
	#category : #Zuul
}

{ #category : #'as yet unclassified' }
ZuulApplication class >> buildApplication [
   ^ ZuulApplication new 
		useBackend: #Gtk with: ZuulConfiguration new;
		new: ZuulUI
]

{ #category : #'initialize-release' }
ZuulApplication class >> close [
	self instance application close.
	instance := nil
]

{ #category : #accessing }
ZuulApplication class >> instance [
	^ instance ifNil: [ 
		instance := self buildApplication  ]
]

{ #category : #'as yet unclassified' }
ZuulApplication class >> open [
	self instance openWithSpec
]

{ #category : #'as yet unclassified' }
ZuulApplication >> allCredentials [
	^  (self credentialsStore allCredentialsWithKey: self cryptoKey) ifEmpty: [ 
		Array with: ZuulCredential new ]
]

{ #category : #accessing }
ZuulApplication >> credentialsStore [
	^ credentialsStore ifNil: [ 
		credentialsStore := ZuulCredentialsStore path: 'data' asFileReference ]
]

{ #category : #storing }
ZuulApplication >> cryptoKey [
	^ cryptoKey ifNil: [ 
		cryptoKey := 'foobar123' ]
]

{ #category : #'as yet unclassified' }
ZuulApplication >> removeCredentials: aZuulCredential [ 
	self credentialsStore removeCredentials: aZuulCredential 
]

{ #category : #'as yet unclassified' }
ZuulApplication >> setCryptoKey: aString [ 
	cryptoKey := aString
]

{ #category : #storing }
ZuulApplication >> storeCredential: aCredential [ 
	self credentialsStore writeCredentials: aCredential key: self cryptoKey.
]
