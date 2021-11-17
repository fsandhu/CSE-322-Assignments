grammar csce322hw01pt02;

@members{
int noOfPlayers = 0;
int gSymbol = 0;
int noOfX = 0;
int totalSymbols = 0;
int cMove = 0;
int ccMove = 0;
int oneEightyMove = 0;
}

// rules
gravityGame : moves maze eof | maze moves eof;

moves : BEGIN_SECTION SECTION_MOVES ASSIGN BEGIN_MOVES moveCheck END_MOVES END_SECTION;
moveCheck : move move move move move move move*;
move: MOVE {
    if ($MOVE.text.equals("c")) {
        cMove++;
    } else if ($MOVE.text.equals("cc")) {
        ccMove++;
    } else if ($MOVE.text.equals("180")) {
        oneEightyMove++;
    }
};

maze : BEGIN_SECTION SECTION_MAZE ASSIGN BEGIN_MAZE xRowFirst mazeRow mazeRow mazeRow mazeRow mazeRow* xRowLast END_MAZE END_SECTION;
mazeRow : mazeX mazeMove mazeMove mazeMove mazeMove mazeMove* mazeX ROW_END;
xRowFirst : mazeX mazeX mazeX mazeX mazeX mazeX mazeX* ROW_END;
xRowLast : mazeX mazeX mazeX mazeX mazeX mazeX mazeX*;
mazeMove : mazeX | mazeG | mazeHyphen | number;
mazeX : MAZEX{noOfX++; totalSymbols++;};
mazeG : MAZEG{gSymbol++; totalSymbols++;};
mazeHyphen : MAZEHYPHEN{totalSymbols++;};
number : NUMERIC{noOfPlayers++; totalSymbols++;};

//semantic analysis
eof : EOF{

    //check number of players in gravityGame
    if (noOfPlayers < 1 || noOfPlayers > 4) {
          System.out.println("The semantic rule 1 was violated.");
    }
        //check if there is only 1 g in the maze
        else if (gSymbol > 1) {
          System.out.println("The semantic rule 2 was violated.");
    }

        //check that number of x symbols do not exceed 60% of total symbols
        else if (noOfX > (0.6 * totalSymbols)) {
          System.out.println("The semantic rule 3 was violated.");
    }

        //check if c, cc and 180 appear at least once in moves
        else if ((cMove == 0) || (ccMove == 0) || (oneEightyMove == 0)) {
          System.out.println("The semantic rule 4 was violated.");
    }
        else {
          System.out.println("The game has " + noOfPlayers + " players.");
    }
};

//tokens
BEGIN_SECTION : '\\begin{section}';
END_SECTION : '\\end{section}';
SECTION_MOVES : '\\title{Moves}';
SECTION_MAZE : '\\title{Maze}';
ASSIGN : '::';
MOVE : 'c' | 'cc' | '180';
// MAZE : '-' | 'g' | 'x' | [0-9];
MAZEG : 'g';
MAZEX : 'x';
MAZEHYPHEN : '-';
NUMERIC : [0-9];
ROW_END : '\\\\';
BEGIN_MAZE : '\\begin{maze}';
END_MAZE : '\\end{maze}';
BEGIN_MOVES : '\\begin{moves}';
END_MOVES : '\\end{moves}';
TILDE : '~' -> skip;
WS : [ \t\n\r]+ -> skip;
ANYTHING : (.);
