Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#category : #TinyBlog
}

{ #category : #testing }
TBBlog class >> createDemoPosts [

	| tmp1 |
	tmp1 := self current.
	tmp1
		writePost: (TBPost
				 title: 'Welcome in TinyBlog'
				 text: 'TinyBlog is a small blog engine made with Pharo.'
				 category: 'TinyBlog') beVisible;
		writePost: (TBPost
				 title: 'Report Pharo Sprint'
				 text:
					 'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
			nice event with more than 15 motivated sprinters. With the help
			of candies, cakes and chocolate, huge work has been done'
				 category: 'Pharo') beVisible;
		writePost: (TBPost
				 title: 'Brick on top of Bloc -
			Preview'
				 text: 'We are happy to announce the first preview
			version of Brick, a new widget set created from scratch on top
			of Bloc. Brick is being developed primarily by Alex Syrel
			(together with Alain Plantec, Andrei Chis and myself), and the
			work is sponsored by ESUG.
			Brick is part of the Glamorous Toolkit effort and will provide
			the basis for the new versions of the development tools.'
				 category: 'Pharo') beVisible;
		writePost: (TBPost
				 title: 'The sad story of unclassified
			blog posts'
				 text: 'So sad that I can read this.') beVisible;
		writePost: (TBPost
				 title: 'Working with Pharo on the
			Raspberry Pi'
				 text: 'Hardware is getting cheaper and many new
			small devices like the famous Raspberry Pi provide new
			computation power that was one once only available on regular
			desktop computers.'
				 category: 'Pharo') beVisible
]

{ #category : #accessing }
TBBlog class >> current [

	^ self selectAll
		ifNotEmpty: [ :e | e anyOne ]
		ifEmpty: [ self new save ]
		
]

{ #category : #'class initialization' }
TBBlog class >> initialize [

	self reset
]

{ #category : #'class initialization' }
TBBlog class >> initializeVoyageMemoryDB [ 
	VOMemoryRepository new enableSingleton 
]

{ #category : #'class initialization' }
TBBlog class >> initializeVoyageMongoDB [ 
	(VOMongoRepository host: 'localhost' database: 'tinyblog') enableSingleton
]

{ #category : #'class initialization' }
TBBlog class >> isVoyageRoot [ 
	"Indicates that instances of this class are top level documents in noSQL databases"
	^ true
]

{ #category : #'class initialization' }
TBBlog class >> reset [
	
	self initializeVoyageMongoDB 
]

{ #category : #accessing }
TBBlog >> allCategories [

	^ (posts collect: [ :arg1 | arg1 category ]) asSet
]

{ #category : #accessing }
TBBlog >> allPosts [

	^ posts asArray
]

{ #category : #accessing }
TBBlog >> allPostsFromCategory: arg1 [

	^ posts select: [ :arg2 | arg2 category == arg1 ]
]

{ #category : #initialization }
TBBlog >> initialize [

	super initialize.
	posts := OrderedCollection new
]

{ #category : #execution }
TBBlog >> removeAllPosts [
   posts do: [ :each | each remove].
	
	posts := OrderedCollection new.
	
	self save
]

{ #category : #accessing }
TBBlog >> size [

	^ posts size
]

{ #category : #accessing }
TBBlog >> visiblePosts [

	^ posts select: [ :arg1 | arg1 isVisible ]
]

{ #category : #accessing }
TBBlog >> visiblePostsFromCategory: arg1 [

	^ posts select: [ :arg2 | arg2 isVisible & (arg2 category = arg1) ]
]

{ #category : #execution }
TBBlog >> writePost: aPost [

	posts add: aPost.
	aPost save.
	self save
]
