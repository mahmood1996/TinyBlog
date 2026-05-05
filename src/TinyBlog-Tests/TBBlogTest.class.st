Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'prevRepository'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #running }
TBBlogTest >> setUp [

	super setUp.
	prevRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.
	blog := TBBlog current.
	post := TBPost title: 'A title' text: 'A text' category: 'A Category'
]

{ #category : #running }
TBBlogTest >> tearDown [ 

	VORepository setRepository: prevRepository.
	super tearDown
]

{ #category : #tests }
TBBlogTest >> testAddBlogPost [

	blog writePost: post.
	self assert: blog size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllBlogPosts [

	blog writePost: post.
	self assert: blog allPosts size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllCategories [

	| tmp1 tmp2 tmp3 |
	tmp1 := post copy.
	tmp1 category: 'Cat1'.
	blog writePost: tmp1 yourself.
	tmp2 := post copy.
	tmp2
		category: 'Cat1';
		beVisible.
	blog writePost: tmp2 yourself.
	tmp3 := post copy.
	tmp3
		category: 'Cat2';
		beVisible.
	blog writePost: tmp3 yourself.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
TBBlogTest >> testBlogPosts [

	| tmp1 |
	blog writePost: post.
	tmp1 := post copy.
	tmp1 beVisible.
	blog writePost: tmp1 yourself.
	self assert: blog visiblePosts size equals: 1
]

{ #category : #tests }
TBBlogTest >> testBlogPostsFromCategory [

	| tmp1 tmp2 tmp3 |
	tmp1 := post copy.
	tmp1 category: 'Cat1'.
	blog writePost: tmp1 yourself.
	tmp2 := post copy.
	tmp2 category: 'Cat2'.
	blog writePost: tmp2 yourself.
	tmp3 := post copy.
	tmp3 category: 'Cat1'.
	blog writePost: tmp3 yourself.
	self assert: (blog allPostsFromCategory: 'Cat1') size equals: 2
]

{ #category : #tests }
TBBlogTest >> testBlogSize [

	self assert: blog size equals: 0
]

{ #category : #tests }
TBBlogTest >> testRemovingAllBlogPosts [

	blog
		writePost: post;
		removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #tests }
TBBlogTest >> testVisibleBlogPosts [

	| tmp1 |
	blog writePost: post.
	tmp1 := post copy.
	tmp1 beVisible.
	blog writePost: tmp1 yourself.
	self assert: blog visiblePosts size equals: 1
]

{ #category : #tests }
TBBlogTest >> testVisiblePostsFromCategory [

	| tmp1 tmp2 tmp3 |
	tmp1 := post copy.
	tmp1 category: 'Cat1'.
	blog writePost: tmp1 yourself.
	tmp2 := post copy.
	tmp2
		category: 'Cat1';
		beVisible.
	blog writePost: tmp2 yourself.
	tmp3 := post copy.
	tmp3
		category: 'Cat2';
		beVisible.
	blog writePost: tmp3 yourself.
	self assert: (blog visiblePostsFromCategory: 'Cat1') size equals: 1
]
