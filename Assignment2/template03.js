var helpers = require( './helpers' );
var pt = require( './csce322hw02pt03' );

var maze = helpers.readMazeFile('part03test01.maze.g');
var moves = helpers.readMovesFile('part03test01.moves.g');
var before = maze.slice(0);

var theFunction = pt.manyPlayersManyRotations( before );
var after = theFunction( moves );
helpers.printMaze( after );
