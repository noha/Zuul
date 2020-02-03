Class {
	#name : #BaselineOfZuul,
	#superclass : #BaselineOf,
	#category : #BaselineOfZuul
}

{ #category : #baselines }
BaselineOfZuul >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		self mars: spec.
		self cryptography: spec.
		spec 
			package: 'Zuul' with: [
				spec requires: #( 'Cryptography' ) ].
			
		spec 
			group: 'default' with: #('Zuul');
			group: 'full' with: #('Mars' 'Zuul') ]
]

{ #category : #'as yet unclassified' }
BaselineOfZuul >> cryptography: spec [

	spec baseline: 'Cryptography' with: [ 
		spec 
			repository: 'github://pharo-contributions/Cryptography/source';
			loads: #( 'Cryptography') ]
]

{ #category : #'as yet unclassified' }
BaselineOfZuul >> mars: spec [

	spec baseline: 'Mars' with: [ 
		spec 
			repository: 'github://pharo-spec/mars-gtk/src' ]
]
