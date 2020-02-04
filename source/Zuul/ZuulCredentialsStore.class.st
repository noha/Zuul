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

{ #category : #'as yet unclassified' }
ZuulCredentialsStore >> allCredentialsWithKey: aString [ 
	| credentials |
	credentials := OrderedCollection new.
	path allFiles do: [ :file |
		[ credentials add: (self readFromFile: file key: aString) ]
			on: CryptographyError, STONReaderError  
			do: [ :err| "we just skip this as the key does not match" ] ].
	^  credentials sorted
]

{ #category : #saving }
ZuulCredentialsStore >> decrypt: aByteArray key: key [
	| aes |
	aes := Rijndael new
		key: (SHA256 hashMessage: key).
	^  aes decrypt: aByteArray .

]

{ #category : #saving }
ZuulCredentialsStore >> encrypt: aString key: key [
	| aes |
	aes := Rijndael new
		key: (SHA256 hashMessage: key).
	^  aes encrypt: aString utf8Encoded

]

{ #category : #accessing }
ZuulCredentialsStore >> path: aFileReference [ 
	
	path := Smalltalk imageDirectory resolveReference: aFileReference.
	path ensureCreateDirectory 
]

{ #category : #loading }
ZuulCredentialsStore >> readFromFile: aFileReference key: key [
	| encrypted ston |
	encrypted := aFileReference binaryReadStream upToEnd.
	ston := self 
		decrypt: encrypted
		key: key.
	^ STON fromString: ston utf8Decoded 
]

{ #category : #removing }
ZuulCredentialsStore >> removeCredentials: aCredential [

	(path / aCredential id) delete
]

{ #category : #saving }
ZuulCredentialsStore >> writeCredentials: aCredential key: aByteArray [
	| encrypted stream |
	encrypted := self 
		encrypt: (STON toString: aCredential)
		key: aByteArray.
	stream := (path / aCredential id) binaryWriteStream.
	stream
		nextPutAll: encrypted;
		flush;
		close.
]
