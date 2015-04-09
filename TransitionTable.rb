module TransitionTable
	STATES = ("A".."R").map {|a| a}

	non = 0
	TRANTABLE = [
	# 	[0-9]	 ,		\s 		 -			 /   		zl  		tys
		["B",	non,	non,	non,  		non,  		non,		non ], #A
		["C", 	"D",	"E",	non,		non,  		non,		non ], #B
		["F", 	"D",  	"E",  	non,		non,		non,		non ], #C
		["D", 	non,	"E",	non,		non,		non,		non ], #D 
		[non,	non,	non,	non,		non,		"G",		"G"	], #E
		["H",	"D",	"E",	non,		non,		non,		non	], #F
		[non,	non,	non,	non,		non,		non,		non	], #G
		["I",	"D",	"E",	"J",		"K",		non,		non	], #H
		["I",	"D",	"E",	non,		non,		non,		non ], #I
		["L",	non,	non,	non,		non,		non,		non	], #J
		["L",	non,	non,	non,		non,		non,		non	], #K
		["M",	non,	non,	non,		non,		non,		non	], #L
		[non,	non,	non,	"N",		"O",		non,		non	], #M
		["P",	non,	non,	non,		non,		non,		non	], #N
		["P",	non,	non,	non,		non,		non,		non	], #O
		["R",	non,	non,	non,		non,		non,		non	], #P
		[non  ,	non,	non,	non,		non,		non,		non	]  #R
	] 
end