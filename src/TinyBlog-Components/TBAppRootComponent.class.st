Class {
	#name : #TBAppRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #testing }
TBAppRootComponent class >> canBeRoot [ 
	"To describe that this component is an application root component"
	
	^ true
]

{ #category : #'class initialization' }
TBAppRootComponent class >> initialize [
	"self initialize"
	| app |
	app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary
]

{ #category : #hooks }
TBAppRootComponent >> children [
	^ { main }
]

{ #category : #initialization }
TBAppRootComponent >> initialize [
	super initialize.
	main := TBCategorizedPostsComponent new.
]

{ #category : #accessing }
TBAppRootComponent >> main: aComponent [
	main := aComponent
]

{ #category : #rendering }
TBAppRootComponent >> renderContentOn: html [
	html render: main
	
]

{ #category : #updating }
TBAppRootComponent >> updateRoot: html [
	super updateRoot: html.
	html beHtml5.
	html title: 'Tiny Blog'
]
