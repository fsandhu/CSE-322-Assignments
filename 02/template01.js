var helpers = require( './helpers' );
var pt = require( './csce322hw02pt01' );

var maze = helpers.readMazeFile('part01test01.maze.g');
var moves = helpers.readMovesFile('part01test01.moves.g');
var before = maze.slice(0);
var theFunction = pt.onePlayerOneRotation( before );
var after = theFunction( moves[0] );

helpers.printMaze( after );
