% notStacked(Maze)
    notStacked(Maze):-
    playerLocations(Maze, Locations),
    not(stackedCheck(Locations)).

% stackedCheck(Locations)
    stackedCheck(Locations):-
    length(Locations, Size),
    Size is 1.
    stackedCheck(Locations):-
    sort(Locations, [FirstLocation, SecondLocation|RestOfLocations]),
    twoLocationCheck([FirstLocation,SecondLocation]),
    stackedCheck(FirstLocation|RestOfLocations),
    stackedCheck(SecondLocation|RestOfLocations),!.

% twoLocationCheck(Location1, Location2)
    twoLocationCheck([(Row1, Column1),(Row2, Column2)]):-
    Column1 is Column2,
    Row2 is Row1+1.

% playerLocations(Maze, PlayerLocationsList)
    playerLocations([], []).
    playerLocations(Maze, PlayerLocationsList):-
    find2D(4, Maze, _),
    fourLocations(Maze, PlayerLocationsList),!.
    playerLocations(Maze, PlayerLocationsList):-
    find2D(3, Maze, _),
    threeLocations(Maze, PlayerLocationsList),!.
    playerLocations(Maze, PlayerLocationsList):-
    find2D(2, Maze, _),
    twoLocations(Maze, PlayerLocationsList),!.
    playerLocations(Maze, PlayerLocationsList):-
    find2D(1, Maze, Location),
    PlayerLocationsList = [Location],!.

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

% fourLocations(Maze, Locations)
    fourLocations(Maze, Locations):-
    find2D(4, Maze, Location4),
    find2D(3, Maze, Location3),
    find2D(2, Maze, Location2),
    find2D(1, Maze, Location1),
    Locations = [Location1, Location2, Location3, Location4],!.

% threeLocations(Maze, Locations)
    threeLocations(Maze, Locations):-
    find2D(3, Maze, Location3),
    find2D(2, Maze, Location2),
    find2D(1, Maze, Location1),
    Locations = [Location1, Location2, Location3],!.

% twoLocations(Maze, Locations)
    twoLocations(Maze, Locations):-
    find2D(2, Maze, Location2),
    find2D(1, Maze, Location1),
    Locations = [Location1, Location2],!.
