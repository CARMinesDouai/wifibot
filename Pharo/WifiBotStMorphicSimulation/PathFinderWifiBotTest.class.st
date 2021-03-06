Class {
	#name : #PathFinderWifiBotTest,
	#superclass : #AbstractWifiBotTest,
	#instVars : [
		'botTarget'
	],
	#category : #'WifiBotStMorphicSimulation-BotExamples-Tests'
}

{ #category : #'setUp-tearDown' }
PathFinderWifiBotTest >> botClass [
	^ PathFinderWifiBot
]

{ #category : #accessing }
PathFinderWifiBotTest >> botTarget [
	^botTarget
]

{ #category : #accessing }
PathFinderWifiBotTest >> botTarget: aPoint [ 
	botTarget := aPoint.
	bot target: aPoint.
	"obstacle position: aPoint"
]

{ #category : #testing }
PathFinderWifiBotTest >> moveForwardFrom: initialCenter towards: target heading: heading [
	bot forwardSpeed: 100.
	botBody heading: heading.
	botBody centerInArena: initialCenter.
	bot target: target.
	bot step.

]

{ #category : #'setUp-tearDown' }
PathFinderWifiBotTest >> setUp [
	super setUp.
	self botTarget: 100@100
]

{ #category : #running }
PathFinderWifiBotTest >> testMoveForwardIfNoObstacle [
	bot forwardSpeed: 20.
	botBody heading: 0.
	botBody positionInArena: 300 @ 300.
	self botTarget: botBody centerInArena - (0@100).
	bot step.
	self assert: botBody positionInArena y < 300. 
	self assert: botBody positionInArena x = 300. 
]

{ #category : #testing }
PathFinderWifiBotTest >> testMoveForwardTowardFrontTarget [
	self moveForwardFrom: 300@300 towards: 300@200 heading: 0.
	self assert: botBody centerInArena x equals: 300.
	self assert: botBody centerInArena y < 300.
	self moveForwardFrom: 300@300 towards: 200@300 heading: 90.
	self assert: botBody centerInArena x < 300.
	self assert: botBody centerInArena y equals: 300.
	self moveForwardFrom: 300@300 towards: 400@300 heading: -90.
	self assert: botBody centerInArena x > 300.
	self assert: botBody centerInArena y equals: 300.
	self moveForwardFrom: 300@300 towards: 300@400 heading: 180.
	self assert: botBody centerInArena x equals: 300.
	self assert: botBody centerInArena y > 300.

]

{ #category : #running }
PathFinderWifiBotTest >> testRotationToLeftOnRightObstacle [
	| obstacleX obstacleY initialHeading |
	initialHeading := -90.
	botBody heading: initialHeading.
	botBody positionInArena: 300 @ 300.
	obstacleX := 300 + bot minDistanceToIgnoreObstacles - 1.
	obstacleY := 300 + (0.75 * botBody morph width).
	obstacle position: obstacleX @ obstacleY.
	self assert: botBody distanceToLeftObstacles equals: 150.
	self assert: botBody distanceToRightObstacles < bot minDistanceToIgnoreObstacles.
	bot step.
	self assert: botBody heading > initialHeading
]

{ #category : #running }
PathFinderWifiBotTest >> testRotationToRightOnLeftObstacle [
	| obstacleX obstacleY initialHeading |
	initialHeading := -90.
	botBody heading: initialHeading.
	botBody positionInArena: 300 @ 300.
	obstacleX := 300 + bot minDistanceToIgnoreObstacles - 1.
	obstacleY := 300 - (0.25 * botBody morph width).
	obstacle position: obstacleX @ obstacleY.
	self assert: botBody distanceToLeftObstacles < bot minDistanceToIgnoreObstacles.
	self assert: botBody distanceToRightObstacles = 150.
	bot step.
	self assert: botBody heading > initialHeading
]

{ #category : #running }
PathFinderWifiBotTest >> testStopIfTargetReached [
"
self run: #testStopIfTargetReached
"

	self botTarget: 100 @ 100.
	obstacle center: self botTarget.
	bot target: self botTarget.
	botBody centerInArena: self botTarget.
	bot forwardSpeed: 100.
	bot step.
	self assert: botBody centerInArena = self botTarget
]

{ #category : #running }
PathFinderWifiBotTest >> testTurnTowardTargetNorthEast [
	botBody heading: 11.
	botBody positionInArena: 300 @ 300.
	self botTarget: 400 @ 200.
	bot step.
	self assert: botBody heading > 270.
	self assert: botBody heading < 360.
]

{ #category : #running }
PathFinderWifiBotTest >> testTurnTowardTargetNorthWest [
	botBody heading: -11.
	botBody centerInArena: 300 @ 300.
	self botTarget: 200 @ 200.
	bot step.
	self assert: botBody heading > 0.
	self assert: botBody heading < 90.
]

{ #category : #running }
PathFinderWifiBotTest >> testTurnTowardTargetSouthEast [
	botBody heading: 101.
	botBody centerInArena: 300 @ 300.
	self botTarget: 400 @ 400.
	bot step.
	self assert: botBody heading < 270.
	self assert: botBody heading > 180
]

{ #category : #running }
PathFinderWifiBotTest >> testTurnTowardTargetSouthWest [
	botBody heading: -11.
	botBody centerInArena: 300 @ 300.
	self botTarget: 200 @ 400.
	bot step.
	self assert: botBody heading > 90.
	self assert: botBody heading < 180.
	
]
