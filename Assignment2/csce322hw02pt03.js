module.exports = {
    manyPlayersManyRotations: manyPlayersManyRotations
}

var helpers = require( './helpers' );

function manyPlayersManyRotations( maze ){

  function whatever( moves ){

  var numberOfPlayers = 0;
  for (var row = 0 ; row < maze.length ; row++) {
    for (var column = 0 ; column < maze[0].length ; column++) {
      if (maze[row][column] == '1') {
        numberOfPlayers++;
      }
      if (maze[row][column] == '2') {
        numberOfPlayers++;
      }
      if (maze[row][column] == '3') {
        numberOfPlayers++;
      }
      if (maze[row][column] == '4') {
        numberOfPlayers++;
      }
    }
  }

  for (var i = 0 ; i < moves.length ; i++) {
    var move = moves[i];

    if (move == 'c') {
      //clockwise move
      var newMaze = []
      for (var row = 0 ; row < maze[0].length ; row++) {
        var rowToPush = [];
        for (var column = maze.length-1 ; column >= 0 ; column--) {
              rowToPush.push(maze[column][row]);
        }
        newMaze.push(rowToPush);
        }
      maze = newMaze;

      for(var playerLoop = 1 ; playerLoop <= numberOfPlayers*4 ; playerLoop++) {
        player = playerLoop%numberOfPlayers;
        if (player==0) {
          player = numberOfPlayers;
        }
      for (var row = maze.length-1 ; row >= 0 ; row--) {
        for (var column = 0 ; column < maze[0].length ; column++) {
          if (maze[row][column] == player.toString()) {
            var playerRow = row;
            var playerColumn = column;
            while (maze[playerRow+1][playerColumn] != 'x') {
              if (maze[playerRow+1][playerColumn] == 'g') {
                maze[playerRow][playerColumn] = '-';
                var location = [playerRow+1, playerColumn];
                maze = goalReached(maze, location, numberOfPlayers, player.toString());
                return maze;
              }
              if (maze[playerRow+1][playerColumn] == '1') {
                break;
              }
              if (maze[playerRow+1][playerColumn] == '2') {
                break;
              }
              if (maze[playerRow+1][playerColumn] == '3') {
                break;
              }
              if (maze[playerRow+1][playerColumn] == '4') {
                break;
              }
              maze[playerRow][playerColumn] = '-';
              maze[playerRow+1][playerColumn] = player.toString();
              playerRow++;
            }
          }
        }
      }
    }
  }


    if (move == 'cc') {
      //counterclockwise move so transpose maze from bottom
      var newMaze = []
      for (var row = maze[0].length-1 ; row >= 0 ; row--) {
        var rowToPush = [];
        for (var column = 0 ; column < maze.length ; column++) {
              rowToPush.push(maze[column][row]);
        }
        newMaze.push(rowToPush);
        }
      maze = newMaze;

      for(var playerLoop = 1 ; playerLoop <= numberOfPlayers*4 ; playerLoop++) {
        player = playerLoop%numberOfPlayers;
        if (player==0) {
          player = numberOfPlayers;
        }
        for (var row = maze.length-1 ; row >= 0 ; row--) {
          for (var column = 0 ; column < maze[0].length ; column++) {
            if (maze[row][column] == player.toString()) {
              var playerRow = row;
              var playerColumn = column;
              while (maze[playerRow+1][playerColumn] != 'x') {
                if (maze[playerRow+1][playerColumn] == 'g') {
                  maze[playerRow][playerColumn] = '-';
                  var location = [playerRow+1, playerColumn];
                  maze = goalReached(maze, location, numberOfPlayers, player.toString());
                  return maze;
                }
                if (maze[playerRow+1][playerColumn] == '1') {
                  break;
                }
                if (maze[playerRow+1][playerColumn] == '2') {
                  break;
                }
                if (maze[playerRow+1][playerColumn] == '3') {
                  break;
                }
                if (maze[playerRow+1][playerColumn] == '4') {
                  break;
                }
                maze[playerRow][playerColumn] = '-';
                maze[playerRow+1][playerColumn] = player.toString();
                playerRow++;
              }
            }
          }
        }
      }
    }

    if (move == '180') {
      var newMaze = []
      for (var row = maze.length-1 ; row >= 0 ; row--) {
        var rowToPush = [];
        for (var column = maze[0].length-1 ; column >= 0 ; column--) {
              rowToPush.push(maze[row][column]);
        }
        newMaze.push(rowToPush);
        }
      maze = newMaze;
      var playerRow = 0;
      var playerColumn = 0;

      //find player location

      for(var playerLoop = 1 ; playerLoop <= numberOfPlayers*4 ; playerLoop++) {
        player = playerLoop%numberOfPlayers;
        if (player==0) {
          player = numberOfPlayers;
        }
        for (var row = maze.length-1 ; row >= 0 ; row--) {
          for (var column = 0 ; column < maze[0].length ; column++) {
            if (maze[row][column] == player.toString()) {
              var playerRow = row;
              var playerColumn = column;
              while (maze[playerRow+1][playerColumn] != 'x') {
                if (maze[playerRow+1][playerColumn] == 'g') {
                  maze[playerRow][playerColumn] = '-';
                  var location = [playerRow+1, playerColumn];
                  maze = goalReached(maze, location, numberOfPlayers, player.toString());
                  return maze;
                }
                if (maze[playerRow+1][playerColumn] == '1') {
                  break;
                }
                if (maze[playerRow+1][playerColumn] == '2') {
                  break;
                }
                if (maze[playerRow+1][playerColumn] == '3') {
                  break;
                }
                if (maze[playerRow+1][playerColumn] == '4') {
                  break;
                }
                maze[playerRow][playerColumn] = '-';
                maze[playerRow+1][playerColumn] = player.toString();
                playerRow++;
              }
            }
          }
        }
      }
    }
  }


return maze;
  }

    return whatever;
}

function goalReached(maze, location, numberOfPlayers, winningPlayer) {
  maze[location[0]][location[1]] = 'x';
  for(var playerLoop = 1 ; playerLoop <= numberOfPlayers*4 ; playerLoop++) {
    player = playerLoop%numberOfPlayers;
    if (player==0) {
      player = numberOfPlayers;
    }
    for (var row = maze.length-1 ; row >= 0 ; row--) {
      for (var column = 0 ; column < maze[0].length ; column++) {
        if (maze[row][column] == player.toString()) {
          var playerRow = row;
          var playerColumn = column;
          while (maze[playerRow+1][playerColumn] != 'x') {
                   if (maze[playerRow+1][playerColumn] == '1') {
                     break;
                   }
                   if (maze[playerRow+1][playerColumn] == '2') {
                     break;
                   }
                   if (maze[playerRow+1][playerColumn] == '3') {
                     break;
                   }
                   if (maze[playerRow+1][playerColumn] == '4') {
                     break;
                   }
            maze[playerRow][playerColumn] = '-';
            maze[playerRow+1][playerColumn] = player.toString();
            playerRow++;
          }
        }
      }
    }
  }
  maze[location[0]][location[1]] = winningPlayer;
  return maze;
}
