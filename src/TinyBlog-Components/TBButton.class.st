Class {
	#name : #TBButton,
	#superclass : #WAComponent,
	#instVars : [
		'props'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #initialization }
TBButton >> initialize [ 
	super initialize.
	props := Dictionary new
]

{ #category : #'as yet unclassified' }
TBButton >> withLabel: aString [
	props at: 'label' put: aString.
	^ self copy
]
