Class {
	#name : #TBPostListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'postsComponents',
		'blog'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBPostListComponent class >> for: aBlog [

	^ self new withBlog: aBlog.
]

{ #category : #private }
TBPostListComponent class >> postComponentFor: post [
	
	^ TBPostComponent for: post.
]

{ #category : #private }
TBPostListComponent class >> postComponentsFor: posts [
	
	^ posts collect: [ :p | self postComponentFor: p ].
]

{ #category : #hooks }
TBPostListComponent >> children [ 
	^ postsComponents asArray
]

{ #category : #initialization }
TBPostListComponent >> initialize [
	super initialize.
	
	postsComponents := Array new
	
]

{ #category : #rendering }
TBPostListComponent >> renderContentOn: html [
	html tbsColumn
			extraSmallSize: 12;
			smallSize: 10;
			mediumSize: 8;
			with: [html render: postsComponents]
]

{ #category : #accessing }
TBPostListComponent >> updateSelectedCategory: aCategoryOrNil [
	
	postsComponents := blog ifNil: [ Array new ] ifNotNil: [ 
		aCategoryOrNil 
			ifNil: [self class postComponentsFor: blog visiblePosts] 
			ifNotNil: [self class postComponentsFor: (blog visiblePostsFromCategory: aCategoryOrNil)].
	]
]

{ #category : #private }
TBPostListComponent >> withBlog: aBlog [

	blog := aBlog.
	
	postsComponents := self class postComponentsFor: blog visiblePosts.
]
