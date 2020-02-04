Class {
	#name : #BaselineOfZuul,
	#superclass : #BaselineOf,
	#category : #BaselineOfZuul
}

{ #category : #baselines }
BaselineOfZuul >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		self cryptography: spec.
		spec 
			package: 'Zuul' with: [
				spec requires: #( 'Cryptography' ) ].
			
		spec 
			group: 'default' with: #('Zuul') ]
]

{ #category : #'as yet unclassified' }
BaselineOfZuul >> cryptography: spec [

	spec baseline: 'Cryptography' with: [ 
		spec 
			repository: 'github://pharo-contributions/Cryptography/source';
			loads: #( 'Cryptography') ]
]
