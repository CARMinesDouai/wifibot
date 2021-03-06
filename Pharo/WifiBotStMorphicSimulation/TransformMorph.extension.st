Extension { #name : #TransformMorph }

{ #category : #'*WifiBotStMorphicSimulation-insertion into arena' }
TransformMorph >> addToArena: arena [ 
	| submorph |
	submorph := self submorphs first.
	(submorph isKindOf: WifiBotMorph) ifTrue: [^arena addWifiBotMorph: self].
	arena addAnyMorph: self
]

{ #category : #'*WifiBotStMorphicSimulation-insertion into arena' }
TransformMorph >> removeFromArena: arena [ 
	| submorph |
	submorph := self submorphs first.
	(submorph isKindOf: WifiBotMorph)
		ifTrue: [^ arena removeWifiBotMorph: self].
	arena removeAnyMorph: self
]
