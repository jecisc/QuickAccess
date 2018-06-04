"
Manages image side quick actions
"
Class {
	#name : #QACActionManager,
	#superclass : #Object,
	#instVars : [
		'iconLibrary',
		'rootFolder'
	],
	#classInstVars : [
		'importFile',
		'default'
	],
	#category : #'QuickAccess-Core-Base'
}

{ #category : #accessing }
QACActionManager class >> default [
	<script: 'self default inspect'>
	
	^ default ifNil: [ default := self basicNew initialize ]
]

{ #category : #accessing }
QACActionManager class >> default: aManager [
	
	^ default := aManager
]

{ #category : #accessing }
QACActionManager class >> importFile [
	^ importFile
]

{ #category : #accessing }
QACActionManager class >> importFile: anObject [
	importFile := anObject.
	self importFromDefaultLocation
]

{ #category : #accessing }
QACActionManager class >> importFromDefaultLocation [
	(self importFile isNil or: [ self importFile exists not ]) ifTrue: [ ^ self ].

	self default import: self importFile
]

{ #category : #accessing }
QACActionManager class >> initialize [
	SessionManager default registerSystemClassNamed: self name
]

{ #category : #'private ' }
QACActionManager class >> reset [
	"Resets the default instance"
	<script>
	
	default := nil.
	 
]

{ #category : #accessing }
QACActionManager class >> startUp [
	super startUp.	
	self importFromDefaultLocation
]

{ #category : #'private-accessing' }
QACActionManager >> allActionItemsSorted [

	^(self rootFolder actionItemsAndSubActionItems) sorted
]

{ #category : #'private-accessing' }
QACActionManager >> allActionsSorted [

	^(self rootFolder actionsAndSubActions) sorted
]

{ #category : #'private-accessing' }
QACActionManager >> folderClass [
	^QACActionFolder
]

{ #category : #accessing }
QACActionManager >> iconLibrary [

	^iconLibrary 
]

{ #category : #initialization }
QACActionManager >> initialize [
	super initialize.
	rootFolder := self folderClass new.
	iconLibrary := QACIconLibrary new
]

{ #category : #printing }
QACActionManager >> printOn: aStream [

	aStream nextPutAll: 'Action manager'
]

{ #category : #accessing }
QACActionManager >> rootFolder [
	^ rootFolder
]

{ #category : #accessing }
QACActionManager >> rootFolder: anObject [
	rootFolder := anObject
]
