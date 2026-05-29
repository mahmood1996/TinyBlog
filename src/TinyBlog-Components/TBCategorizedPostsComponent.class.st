Class {
	#name : #TBCategorizedPostsComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'postsComponent',
		'categoriesComponent'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #hooks }
TBCategorizedPostsComponent >> children [
	^ super children , { postsComponent . categoriesComponent }
]

{ #category : #hooks }
TBCategorizedPostsComponent >> headerComponent [ 
	^ TBHeaderComponent withOnTrailingPressed: [ self call: TBAdminComponent new ]
]

{ #category : #initialization }
TBCategorizedPostsComponent >> initialize [
	super initialize.
	
	postsComponent := TBPostListComponent for: self blog.
	
	categoriesComponent := (TBCategoriesComponent for: self blog allCategories) 
									onAllTap: [ postsComponent updateSelectedCategory: nil ];
									onCategoryTap: [ :category | postsComponent updateSelectedCategory: category ];
									yourself
		
]

{ #category : #private }
TBCategorizedPostsComponent >> renderCategoriesOn: html [

	html tbsColumn
			extraSmallSize: 12;
			smallSize: 2;
			mediumSize: 4;
			with: [ html render: categoriesComponent ].
]

{ #category : #rendering }
TBCategorizedPostsComponent >> renderContentOn: html [
	super renderContentOn: html.
	
	html tbsContainer: [
		html tbsRow showGrid;
			with: [
				self renderCategoriesOn: html.
				self renderPostListOn: html ] ]
]

{ #category : #private }
TBCategorizedPostsComponent >> renderPostListOn: html [

	html tbsColumn
			extraSmallSize: 12;
			smallSize: 10;
			mediumSize: 8;
			with: [ html render: postsComponent ]
]
