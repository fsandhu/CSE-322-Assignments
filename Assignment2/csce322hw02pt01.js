module.exports = {
    onePlayerOneRotation: onePlayerOneRotation
}

var helpers = require( './helpers' );

function onePlayerOneRotation( maze ){

    function whatever( move ){

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
        var playerRow = 0;
        var playerColumn = 0;

        //find player location
        for (var row = 0 ; row < maze.length ; row++) {
          for (var column = 0 ; column < maze[0].length ; column++) {
            if (maze[row][column] == '1') {
              playerRow = row;
              playerColumn = column;
            }
          }
        }

        //player falls down
        while (maze[playerRow+1][playerColumn] != 'x') {
          if (maze[playerRow+1][playerColumn] == 'g') {
            maze[playerRow][playerColumn] = '-';
            maze[playerRow+1][playerColumn] = '1';
            break;
          }
          maze[playerRow][playerColumn] = '-';
          maze[playerRow+1][playerColumn] = '1';
          playerRow++;
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
        var playerRow = 0;
        var playerColumn = 0;

        //find player location
        for (var row = 0 ; row < maze.length ; row++) {
          for (var column = 0 ; column < maze[0].length ; column++) {
            if (maze[row][column] == '1') {
              playerRow = row;
              playerColumn = column;
            }
          }
        }

        //player falls down
        while (maze[playerRow+1][playerColumn] != 'x') {
          if (maze[playerRow+1][playerColumn] == 'g') {
            maze[playerRow][playerColumn] = '-';
            maze[playerRow+1][playerColumn] = '1';
            break;
          }
          maze[playerRow][playerColumn] = '-';
          maze[playerRow+1][playerColumn] = '1';
          playerRow++;
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
        for (var row = 0 ; row < maze.length ; row++) {
          for (var column = 0 ; column < maze[0].length ; column++) {
            if (maze[row][column] == '1') {
              playerRow = row;
              playerColumn = column;
            }
          }
        }

        //player falls down
        while (maze[playerRow+1][playerColumn] != 'x') {
          if (maze[playerRow+1][playerColumn] == 'g') {
            maze[playerRow][playerColumn] = '-';
            maze[playerRow+1][playerColumn] = '1';
            break;
          }
          maze[playerRow][playerColumn] = '-';
          maze[playerRow+1][playerColumn] = '1';
          playerRow++;
        }
      }


	return maze;
    }

    return whatever;
}
