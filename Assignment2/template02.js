var helpers = require( './helpers' );
var pt = require( './csce322hw02pt02' );

var maze = helpers.readMazeFile('part02test01.maze.g');
var moves = helpers.readMovesFile('part02test01.moves.g');
var before = maze.slice(0);

var theFunction = pt.onePlayerManyRotations( before );
var after = theFunction( moves );
helpers.printMaze( after );
