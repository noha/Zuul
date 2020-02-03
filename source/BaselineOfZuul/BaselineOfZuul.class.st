Class {
	#name : #BaselineOfZuul,
	#superclass : #BaselineOf,
	#category : #BaselineOfZuul
}

{ #category : #baselines }
BaselineOfZuul >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			package: 'Zuul'.
			
		spec 
			group: 'default' with: #('Zuul') ]
]
