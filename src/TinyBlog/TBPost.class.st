Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'category',
		'date',
		'visible'
	],
	#category : #TinyBlog
}

{ #category : #constants }
TBPost class >> isVoyageRoot [ 
	"Indicates that instances of this class are top level documents in noSQL databases"
	^ true
]

{ #category : #'instance creation' }
TBPost class >> title: arg1 text: arg2 [

	| tmp2 |
	tmp2 := self new.
	tmp2
		title: arg1;
		text: arg2.
	^ tmp2 yourself
]

{ #category : #'instance creation' }
TBPost class >> title: arg1 text: arg2 category: arg3 [

	^ (self title: arg1 text: arg2) category: arg3
]

{ #category : #constants }
TBPost class >> unclassifiedTag [

	^ 'Unclassified'
]

{ #category : #action }
TBPost >> beVisible [

	visible := true
]

{ #category : #accessing }
TBPost >> category [

	^ category
]

{ #category : #accessing }
TBPost >> category: arg1 [

	category := arg1
]

{ #category : #accessing }
TBPost >> date [

	^ date
]

{ #category : #accessing }
TBPost >> date: aDate [

	date := aDate
]

{ #category : #initialization }
TBPost >> initialize [

	super initialize.
	self notVisible.
	self date: Date today.
	self category: self class unclassifiedTag
]

{ #category : #testing }
TBPost >> isUnclassified [

	^ category == self class unclassifiedTag
]

{ #category : #testing }
TBPost >> isVisible [

	^ visible
]

{ #category : #action }
TBPost >> notVisible [

	visible := false
]

{ #category : #accessing }
TBPost >> text [

	^ text
]

{ #category : #accessing }
TBPost >> text: arg1 [

	text := arg1
]

{ #category : #accessing }
TBPost >> title [

	^ title
]

{ #category : #accessing }
TBPost >> title: arg1 [

	title := arg1
]
