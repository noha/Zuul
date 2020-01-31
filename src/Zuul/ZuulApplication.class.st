Class {
	#name : #ZuulApplication,
	#superclass : #SpApplication,
	#instVars : [
		'credentialsStore'
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

{ #category : #accessing }
ZuulApplication >> credentialsStore [
	^ credentialsStore ifNil: [ 
		credentialsStore := ZuulCredentialsStore path: 'data' asFileReference ]
]

{ #category : #storing }
ZuulApplication >> store: aCredential [ 
	self credentialsStore storeCredentials: aCredential
]
