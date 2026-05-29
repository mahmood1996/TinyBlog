Class {
	#name : #TBAdminComponent,
	#superclass : #TBScreenComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #hooks }
TBAdminComponent >> headerComponent [ 

	^ TBAdminHeaderComponent withOnTrailingPressed: [ self answer ]
]

{ #category : #rendering }
TBAdminComponent >> renderContentOn: html [

	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Blog Admin'.
		html horizontalRule 
	]
]
