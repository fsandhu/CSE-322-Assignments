import Prelude
import System.Environment ( getArgs )
import Data.List
import Data.Char
import Helpers

-- The main method that will be used for testing / command line access
main = do
 args <- getArgs
 filename <- readFile (head args)
 (maze,moves) <- readGravityMazeFile filename
 print "Result"
 printMaze (manyPlayersManyRotations maze moves)

-- YOUR CODE SHOULD COME AFTER THIS POINT
manyPlayersManyRotations :: [[Char]] -> [[Char]] -> [[Char]]
manyPlayersManyRotations [] _ = []
manyPlayersManyRotations maze [] = maze
manyPlayersManyRotations maze (h : t) = manyPlayersManyRotations (slideCheck (updateMaze maze h) (players maze)) t

counterClockwise :: [[a]] -> [[a]]
counterClockwise ([]:_) = []
counterClockwise maze = (map last maze) : counterClockwise (map init maze)

clockwise :: [[a]] -> [[a]]
clockwise ([]:_) = []
clockwise maze = reverse (map head maze) : clockwise (map tail maze)

oneEighty :: [[a]] -> [[a]]
oneEighty ([]:_) = []
oneEighty ([]) = []
oneEighty maze = reverse (last maze) : oneEighty (init maze)

players :: [[Char]] -> [Char]
players [] = []
players maze
 | (ifFound (find2D '4' maze)) = "1234123412341234"
 | (ifFound (find2D '3' maze)) = "123123123"
 | (ifFound (find2D '2' maze)) = "1212"
 | (ifFound (find2D '1' maze)) = "1"
 | otherwise = []


find2D :: Eq e => e -> [[e]] -> [(Int,Int)]
find2D e listOfLists = find2DHelper e listOfLists 0

find2DHelper :: Eq e => e -> [[e]] -> Int -> [(Int,Int)]
find2DHelper _ [] _ = []
find2DHelper e (list:lists) i = listTu ++ listsA
  where eList = find1D e list
        eLists= find2DHelper e lists (i+1)
        listTu= map zeroTuple eList
        listsA= map incTuple eLists

zeroTuple :: Int -> (Int,Int)
zeroTuple a = (0,a)

incTuple :: (Int,Int) -> (Int,Int)
incTuple (a,b) = (a+1,b)

find1D :: Eq a => a -> [a] -> [Int]
find1D e list = (findHelper e list 0)

findHelper :: Eq a => a -> [a] -> Int -> [Int]
findHelper _ [] _ = []
findHelper e (h:t) i
 | ( e == h ) = i:(findHelper e t (i+1))
 | otherwise = (findHelper e t (i+1))

ifFound :: [(Int, Int)] -> Bool
ifFound ([]) = False
ifFound listOfLists
 | length(listOfLists) > 0 = True
 | otherwise = False

updateMaze :: [[Char]] -> [Char] -> [[Char]]
updateMaze maze move
 | not (ifFound (find2D 'g' maze)) = maze
 | (move == "c") = clockwise maze
 | (move == "cc") = counterClockwise maze
 | (move == "180") = oneEighty maze
 | otherwise = error "invalid move"

replace :: a -> Int -> [a] -> [a]
replace _ _ [] = []
replace value index (h : t)
 | (index == 0) = value : t
 | otherwise = h : replace value (index-1) t

replace2D :: (Int, Int) -> a -> [[a]] -> [[a]]
replace2D (row, column) value maze = (replace2DHelper (row, column) value maze 0)

replace2DHelper :: (Int, Int) -> a -> [[a]] -> Int -> [[a]]
replace2DHelper _ _ [] _ = []
replace2DHelper (row, column) value (h : t) currentRow
 | (row == 0) = replace value column h : t
 | (currentRow == row) = replace value column h : t
 | otherwise = h : replace2DHelper (row, column) value t (currentRow+1)

slideCheck :: [[Char]] -> [Char] -> [[Char]]
slideCheck maze (h : t)
 | (ifFound (find2D 'g' maze)) = slideCheck (slide maze (head (find2D h maze)) h) t
 | otherwise = maze

slide :: [[Char]] -> (Int, Int) -> Char -> [[Char]]
slide [] _ _ = []
slide maze (row, column) player
 | ((maze !! (row+1) !! (column)) /= 'g') && ((maze !! (row+1) !! (column)) /= 'x') = slide (replace2D (row, column) '-' (replace2D ((row+1),(column)) player maze)) ((row+1),(column)) player
 | ((maze !! (row+1) !! (column)) == 'g') = (replace2D (row, column) '-' (replace2D ((row+1),(column)) player maze))
 | otherwise = maze
