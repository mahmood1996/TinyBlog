Class {
	#name : #TBPostTest,
	#superclass : #TestCase,
	#instVars : [
		'prevRepository'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #running }
TBPostTest >> setUp [
	super setUp.
	
	prevRepository := VORepository  current.
	VORepository setRepository: VOMemoryRepository new.
]

{ #category : #running }
TBPostTest >> tearDown [
	
	VORepository setRepository: prevRepository.
	super tearDown.
]

{ #category : #tests }
TBPostTest >> testCreatePost [

	| tmp1 |
	tmp1 := TBPost title: 'Test' text: 'Some text'.
	self
		assert: tmp1 title equals: 'Test';
		assert: tmp1 text equals: 'Some text';
		assert: tmp1 date dayOfWeek equals: Date today dayOfWeek;
		assert: tmp1 isUnclassified;
		deny: tmp1 isVisible
]

{ #category : #tests }
TBPostTest >> testMakingPostInVisible [

	| tmp1 tmp2 |
	tmp2 := TBPost title: '' text: ''.
	tmp2 notVisible.
	tmp1 := tmp2 yourself.
	self deny: tmp1 isVisible
]

{ #category : #tests }
TBPostTest >> testMakingPostVisible [

	| tmp1 tmp2 |
	tmp2 := TBPost title: '' text: ''.
	tmp2 beVisible.
	tmp1 := tmp2 yourself.
	self assert: tmp1 isVisible
]

{ #category : #tests }
TBPostTest >> testPostWithCategory [

	| tmp1 |
	tmp1 := TBPost title: '' text: '' category: 'Pharo'.
	self assert: tmp1 category equals: 'Pharo'
]
