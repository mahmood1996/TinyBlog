Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'onTrailingPressed'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBHeaderComponent class >> withOnTrailingPressed: aBlock [
	"Create a header component"
	^ self new withOnTrailingPressed: aBlock
]

{ #category : #private }
TBHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [
			html tbsNavbarBrand
				url: self application url;
				with: 'TinyBlog' 
			]
]

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [
		html tbsContainer: [
		
		self renderBrandOn: html.
		
		self renderTrailingButtonOn: html.
	]]
]

{ #category : #hooks }
TBHeaderComponent >> renderTrailingButtonOn: html [
	
	html form: [
		html tbsNavbarButton
		tbsPullRight;
		callback: onTrailingPressed;
		with: [
			html tbsGlyphIcon iconListAlt.
			html text: ' Admin View' ] ]
]

{ #category : #hooks }
TBHeaderComponent >> withOnTrailingPressed: aBlock [
	onTrailingPressed := aBlock
]
