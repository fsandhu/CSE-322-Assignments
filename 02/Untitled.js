var playerRow = 0;
var playerColumn = 0;

//find player location

for (var i = 1 ; i <= numberOfPlayers ; i++){
  for (var row = 0 ; row < maze.length ; row++) {
    for (var column = 0 ; column < maze[0].length ; column++) {
      if (maze[row][column] == i) {
        playerRow = row;
        playerColumn = column;
        }
    }
  }
  while (maze[playerRow+1][playerColumn] != 'x' ||
         maze[playerRow+1][playerColumn] != '1' ||
         maze[playerRow+1][playerColumn] != '2' ||
         maze[playerRow+1][playerColumn] != '3' ||
         maze[playerRow+1][playerColumn] != '4') {

         if (maze[playerRow+1][playerColumn] == 'g') {
           maze[playerRow][playerColumn] = '-';
           maze[playerRow+1][playerColumn] = i;
           var location = [playerRow+1, playerColumn];
           maze = goalReached(maze, location, numberOfPlayers, i);
           return maze;
         }

         maze[playerRow][playerColumn] = '-';
         maze[playerRow+1][playerColumn] = i;
         playerRow++;
  }
}
