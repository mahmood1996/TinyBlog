Class {
	#name : #TBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'callbacks',
		'selectedCategory'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBCategoriesComponent class >> for: categories [

	^ self new withCategories: categories
]

{ #category : #initialization }
TBCategoriesComponent >> initialize [
	super initialize.

	callbacks := { 'all' -> [  ] . 'category' -> [ :c | ] } asDictionary.
	categories  := Array new
]

{ #category : #action }
TBCategoriesComponent >> onAllTap: aBlock [

	callbacks at: 'all' put: [selectedCategory := nil. aBlock value]
]

{ #category : #action }
TBCategoriesComponent >> onCategoryTap: aBlock [

	callbacks at: 'category' put: [
		:category | 
		selectedCategory := category. 
		aBlock value: category ]
]

{ #category : #rendering }
TBCategoriesComponent >> renderAllCategoriesLinkOn: html [ 
	html tbsLinkifyListGroupItem
		class: 'active' if: selectedCategory isNil;
		callback: [ (callbacks at: 'all') value];
		with: 'All'.
]

{ #category : #rendering }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
	html tbsLinkifyListGroupItem
	   class: 'active' if: selectedCategory = aCategory;
		callback: [ (callbacks at: 'category') value: aCategory ];
		with: aCategory
]

{ #category : #rendering }
TBCategoriesComponent >> renderContentOn: html [ 
	
	html tbsListGroup: [
		html tbsListGroupItem
			with: [ html strong: 'Categories' ].
		self renderAllCategoriesLinkOn: html.
		categories do: [ :cat |
			self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #private }
TBCategoriesComponent >> withCallbacks: allCallbacks [ 

	callbacks := allCallbacks
]

{ #category : #private }
TBCategoriesComponent >> withCategories: allCategories [

	categories := allCategories sorted: [ :c :o | (c at: 1) < (o at: 1)]
]
