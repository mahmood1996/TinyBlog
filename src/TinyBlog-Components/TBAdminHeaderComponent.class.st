Class {
	#name : #TBAdminHeaderComponent,
	#superclass : #TBHeaderComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #hooks }
TBAdminHeaderComponent >> renderTrailingButtonOn: html [
	
	html form: [
		html tbsNavbarButton
		tbsPullRight;
		with: [
			html tbsGlyphIcon iconLogout.
			html text: ' Discoonect' ] ]
]
