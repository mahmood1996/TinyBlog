Class {
	#name : #TBPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBPostComponent class >> for: aPost [
	^ self new post: aPost
]

{ #category : #accessing }
TBPostComponent >> post: aPost [
	post := aPost.
]

{ #category : #rendering }
TBPostComponent >> renderContentOn: html [
	html heading level: 2; with: post title.
	html heading level: 6; with: post date.
	html text: post text
]
