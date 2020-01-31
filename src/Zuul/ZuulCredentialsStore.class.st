Class {
	#name : #ZuulCredentialsStore,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #Zuul
}

{ #category : #'instance creation' }
ZuulCredentialsStore class >> path: aFileReference [ 
	
	^ self new path: aFileReference 
]

{ #category : #loading }
ZuulCredentialsStore >> fetchCredentialsFrom: aFileReference [ 
	
	^ STON fromStream: aFileReference readStream
]

{ #category : #accessing }
ZuulCredentialsStore >> path: aFileReference [ 
	
	path := aFileReference.
	path ensureCreateDirectory 
]

{ #category : #saving }
ZuulCredentialsStore >> storeCredentials: aCredential [ 
	| stream |
	stream := (path / aCredential id) writeStream.
	STON put: aCredential onStream: stream.
	stream
		flush;
		close.
]
