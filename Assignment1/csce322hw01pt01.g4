grammar csce322hw01pt01;

//rules

gravityGame : (moveSection | mazeSection)* eof | anythingElse eof;
moveSection : beginSection movesTitle assign beginMoves (moves | ws)* endMoves endSection;
moves : move TILDE moves | move;
mazeSection : beginSection mazeTitle assign beginMaze (maze | endRow)* endMaze endSection;

beginSection : BEGIN_SECTION{ System.out.println("Open Section: \\begin{section}"); };
endSection : END_SECTION{ System.out.println("Close Section: \\end{section}"); };
movesTitle : SECTION_MOVES{ System.out.println("Section Title: \\title{Moves}"); };
mazeTitle : SECTION_MAZE{ System.out.println("Section Title: \\title{Maze}"); };
assign : ASSIGN{ System.out.println("Designation: ::"); };
move : MOVE{ System.out.println("Move: " + $MOVE.text); };
maze : MAZE{ System.out.println("Location: " + $MAZE.text); };
endRow: ROW_END{ System.out.println("Close Row: \\\\"); };
beginMaze : BEGIN_MAZE{ System.out.println("Open Maze: \\begin{maze}"); };
beginMoves : BEGIN_MOVES{ System.out.println("Open Moves: \\begin{moves}"); };
endMaze : END_MAZE{ System.out.println("Close Maze: \\end{maze}"); };
endMoves : END_MOVES{ System.out.println("Close Moves: \\end{moves}"); };
eof : EOF{ System.out.println( "Close of File" ); };
ws : WS;
anythingElse : ANYTHING{ System.out.println("The unrecognizable token " + $ANYTHING.text + " appears in line " + $ANYTHING.line + "."); System.exit(0);};

//tokens
BEGIN_SECTION : '\\begin{section}';
END_SECTION : '\\end{section}';
SECTION_MOVES : '\\title{Moves}';
SECTION_MAZE : '\\title{Maze}';
ASSIGN : '::';
MOVE : 'c' | 'cc' | '180';
MAZE : '-' | 'g' | 'x' | [0-9];
NUMERIC : [0-9];
ROW_END : '\\\\';
BEGIN_MAZE : '\\begin{maze}';
END_MAZE : '\\end{maze}';
BEGIN_MOVES : '\\begin{moves}';
END_MOVES : '\\end{moves}';
TILDE : '~';
WS : [ \t\n\r]+ -> skip;
ANYTHING : (.);
