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

{ #category : #tests }
ZuulCredentialsStoreTest >> dummyCredentials2 [
	^ ZuulCredential new 
		title: 'C2';
		user: 'user2';
		passphrase: 'passphrase2'
]

{ #category : #running }
ZuulCredentialsStoreTest >> setUp [ 
	super setUp.
	filesystem := FileSystem memory.
	store := ZuulCredentialsStore path: filesystem root / #data
]

{ #category : #tests }
ZuulCredentialsStoreTest >> testLoadAllCredentialsDifferentKey [
	| c1 c2 |
	c1 := self dummyCredentials.
	store writeCredentials: c1 key: 'foobar'. 
	c2 := self dummyCredentials2.
	store writeCredentials: c2 key: 'barfoo'.
	
	self assert: (store allCredentialsWithKey: 'foobar') size equals: 1.
	self assert: (store allCredentialsWithKey: 'barfoo') size equals: 1


]

{ #category : #tests }
ZuulCredentialsStoreTest >> testLoadAllCredentialsSameKey [
	| c1 c2 credentials |
	c1 := self dummyCredentials.
	store writeCredentials: c1 key: 'foobar'. 
	c2 := self dummyCredentials2.
	store writeCredentials: c2 key: 'foobar'.
	
	credentials := store allCredentialsWithKey: 'foobar'.
	self assert: credentials size equals: 2

]

{ #category : #tests }
ZuulCredentialsStoreTest >> testLoadAllCredentialsWrongKey [
	| c1 c2 credentials |
	c1 := self dummyCredentials.
	store writeCredentials: c1 key: 'foobar'. 
	c2 := self dummyCredentials2.
	store writeCredentials: c2 key: 'barfoo'.
	
	credentials := store allCredentialsWithKey: 'boofar'.
	self assert: credentials size equals: 0

]

{ #category : #tests }
ZuulCredentialsStoreTest >> testLoadCredentials [
	| credentials cred |
	credentials := self dummyCredentials.
	store writeCredentials: credentials key: 'foobar'. 
	
	cred := store 
		readFromFile: filesystem root / #data / credentials id
		key: 'foobar'.
	self assert: cred id equals: credentials id.
	self assert: cred title equals: credentials title
]

{ #category : #tests }
ZuulCredentialsStoreTest >> testSaveCredentials [
	| credentials |
	credentials := self dummyCredentials.
	store writeCredentials: credentials key: 'foobar'. 
	self assert: (filesystem root / #data / credentials id) exists
]

{ #category : #tests }
ZuulCredentialsStoreTest >> testStoreCreation [
	self assert: (filesystem root / #data) exists
	
]
