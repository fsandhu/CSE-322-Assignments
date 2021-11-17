% rotationsAndPlayers(Rotations,Maze)
    rotationsAndPlayers(Rotations,Maze):-
    playersList(Maze, PlayerList),
    bothOdd(Rotations, PlayerList).
    rotationsAndPlayers(Rotations,Maze):-
    playersList(Maze, PlayerList),
    bothEven(Rotations, PlayerList).

% find2D(What,ListOfLists,Where)
    find2D(What,[Row|_],(0,Column)):-
    find(What,Row,Column).
    find2D(What,[_|Rows],(R,C)):-
    find2D(What,Rows,(RowsR,C)),
    R is RowsR + 1.

% find(What,List,Where)
    find(What,[What|_],0).
    find(What,[_|T],Where):-
    find(What,T,WhereT),
    Where is WhereT + 1.

% isOdd(List)
    isOdd([]).
    isOdd(List):-
    length(List, S),
    1 is mod(S, 2),!.

% isEven(List)
    isEven([]).
    isEven(List):-
    length(List, S),
    0 is mod(S, 2),!.

% playersList(Maze, PlayerList)
    playersList([], []).
    playersList(Maze, PlayersList):-
    find2D(4, Maze, _),
    PlayersList = [1, 2, 3, 4],!.
    playersList(Maze, PlayersList):-
    find2D(3, Maze, _),
    PlayersList = [1, 2, 3],!.
    playersList(Maze, PlayersList):-
    find2D(2, Maze, _),
    PlayersList = [1, 2],!.
    playersList(Maze, PlayersList):-
    find2D(1, Maze, _),
    PlayersList = [1],!.

% bothOdd(List1, List2)
    bothOdd([],[]).
    bothOdd(List1, List2):-
    isOdd(List1),
    isOdd(List2).

% bothEven(List1, List2)
    bothEven([],[]).
    bothEven(List1, List2):-
    isEven(List1),
    isEven(List2).
