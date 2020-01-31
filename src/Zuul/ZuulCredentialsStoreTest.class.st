Class {
	#name : #ZuulCredentialsStoreTest,
	#superclass : #TestCase,
	#instVars : [
		'filesystem',
		'store'
	],
	#category : #Zuul
}

{ #category : #tests }
ZuulCredentialsStoreTest >> dummyCredentials [
	^ ZuulCredential new 
		title: 'C1';
		user: 'user';
		passphrase: 'passphrase'
]

{ #category : #running }
ZuulCredentialsStoreTest >> setUp [ 
	super setUp.
	filesystem := FileSystem memory.
	store := ZuulCredentialsStore path: filesystem root / #data
]

{ #category : #tests }
ZuulCredentialsStoreTest >> testLoadCredentials [
	| credentials cred |
	credentials := self dummyCredentials.
	store storeCredentials: credentials. 
	
	cred := store fetchCredentialsFrom: filesystem root / #data / credentials id.
	self assert: cred id equals: credentials id.
	self assert: cred title equals: credentials title
]

{ #category : #tests }
ZuulCredentialsStoreTest >> testSaveCredentials [
	| credentials |
	credentials := self dummyCredentials.
	store storeCredentials: credentials. 
	self assert: (filesystem root / #data / credentials id) exists
]

{ #category : #tests }
ZuulCredentialsStoreTest >> testStoreCreation [
	self assert: (filesystem root / #data) exists
	
]
