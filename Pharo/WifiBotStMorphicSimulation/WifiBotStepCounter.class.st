Class {
	#name : #WifiBotStepCounter,
	#superclass : #WifiBot,
	#instVars : [
		'stepCount'
	],
	#category : #'WifiBotStMorphicSimulation-Kernel-Test'
}

{ #category : #'initialize-release' }
WifiBotStepCounter >> initialize [
	super initialize.
	self stepCount: 0
]

{ #category : #stepping }
WifiBotStepCounter >> step [
	self stepCount: self stepCount + 1
]

{ #category : #accessing }
WifiBotStepCounter >> stepCount [
	^stepCount
]

{ #category : #accessing }
WifiBotStepCounter >> stepCount: anObject [
	stepCount := anObject
]
