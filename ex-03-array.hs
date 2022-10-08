module Exer03Prob where

-- Slide questions:
-- Consider a function safetail that behaves in the
-- same way as tail, except that safetail maps the
-- empty list to the empty list, whereas tail gives
-- an error in this case. Define safetail using:
-- (a) a conditional expression;
-- (b) guarded equations;
-- (c) pattern matching
safetailCond xs = if null xs then [] else x where (_:x) = xs
safetailGuarded xs | null xs  = [] | otherwise = ys where (_:ys) = xs
safetailPattern [] = []
safetailPattern (x:xs) = xs


--Give three possible definitions for the logical
-- or operator (||) using pattern matching
patternOr True _ = True
patternOr _ True = True
patternOr _ _ = False

--Redefine the following version of (&&) using
--conditionals rather than patterns:
--  True && True = True
--  _ && _ = False

andOp a b = if a then if b then True else False else False

-- True && b = b
-- False && _ = False

andOp2 a b = if a then b else False

-- Develop some functions using recursion over lists.
-- Higher-order functions are not required yet.

toBeImplemented = undefined

--delDups deletes duplicates from a list
testDelDups =
  delDups [1,2,3,4,5] == [1,2,3,4,5] &&
  delDups [1,1,1,1,1] == [1] &&
  (delDups [1,2,2,4,1] == [1,2,4] || delDups [1,2,2,4,1] == [2,4,1]) &&
  delDups []          == ([] :: [Int])

elem1 :: Eq a => a -> [a] -> Bool
elem1 x [] = False
elem1 x xs = x == b || elem1 x bs where (b:bs) = xs

delDups :: Eq a => [a] -> [a]
delDups [] = []
delDups (x : xs) 
 | elem1 x xs = delDups xs
 | otherwise = x : delDups xs

  
  
-- removeEachSnd removes each second element from a list.
testRemoveEachSnd =
  removeEachSnd [1,2,3,4,5,6,7,8] == [1,3,5,7] &&
  removeEachSnd [1,2,3,4,5,6,7]   == [1,3,5,7] &&
  removeEachSnd [1]               == [1] &&
  removeEachSnd []                == ([] :: [Int])

removeEachSnd :: [a] -> [a]
removeEachSnd [] = []
removeEachSnd (x : _ : xs) = x : removeEachSnd xs
removeEachSnd xs = xs  

-- makePairs pairs adjacent elements of a list
testMakePairs =
  makePairs [1,2,3,4,5,6,7,8] == [(1,2),(3,4),(5,6),(7,8)] &&
  makePairs [1,2,3,4,5,6,7]   == [(1,2),(3,4),(5,6)] &&
  makePairs [1,2]             == [(1,2)] &&
  makePairs [1]               == [] &&
  makePairs []                == ([] :: [(Int,Int)])

makePairs :: [a] -> [(a, a)]
makePairs [] = []
makePairs (a : b : xs) = (a, b) : makePairs xs
makePairs xs = []

testMakePairsV2 =
  makePairsV2 [1,2,3,4,5,6,7,8] == [(1,2),(3,4),(5,6),(7,8)] &&
  makePairsV2 [1,2,3,4,5,6,7]   == [(1,2),(3,4),(5,6)] &&
  makePairsV2 [1,2]             == [(1,2)] &&
  makePairsV2 [1]               == [] &&
  makePairsV2 []                == ([] :: [(Int,Int)])

makePairsV2 :: [a] -> [(a, a)]
makePairsV2 = toBeImplemented

-- halve divides a list into two lists containing each second element,
-- the first list beginning with the first,
-- the second list beginning with the second
testHalve =
  halve [1,2,3,4,5,6] == ([1,3,5], [2,4,6]) &&
  halve [1,2,3,4,5]   == ([1,3,5], [2,4]) &&
  halve [1]           == ([1], []) &&
  halve []            == ([], [] :: [Int])

halve :: [a] -> ([a], [a])
halve [] = ([], [])
halve xs@(x:ys) = (removeEachSnd xs, removeEachSnd ys)


-- divideList divides a list into chunks of length n each, except
-- of the last chunk, which might be shorter
-- Precondition:
--   n > 0
-- Theorem:
--   For all n > 0 and all xs: concat (divideList n xs) == xs
testDivideList =
  divideList 3 [1 .. 10] == [[1,2,3],[4,5,6],[7,8,9],[10]] &&
  divideList 3 [1 .. 9] == [[1,2,3],[4,5,6],[7,8,9]] &&
  divideList 3 [1] == [[1]] &&
  divideList 3 [] == ([] :: [[Int]])

divideList :: Int -> [a] -> [[a]]
divideList _ [] = []
divideList n  xs = (take n xs) : (divideList n (drop n xs))
