module Exeri03Basic where
{-
Problem 1 [List sugaring] Rewrite the following expressions so that they don’t
contain the list constructor : (‘cons’) any longer.
-}
s1
1 : 2 : 3 : [4] == [1,2,3,4]
s2 = 
1 : 2 : [3 , 4] == [1,2,3,4]
s3
(1 : 2 : []) : (3 : []) : [] == [[1,2],[3]]
s4
(1 , 2) : (3 , 4) : [(5 , 6)] == [(1,2),(3,4),(5,6)]
s5 = [] : []
s6 = [] : [] : []
s7 = ([] : []) : []
([] : []) : [] == [[[]]]
s8 = (([] : []) : []) : []
(([] : []) : []) : []== [[[[]]]]
s9 = 'a' : 'b' : []
'a' : 'b' : [] == ['a','b']
{-
tests1 = s1 == [1,2,3,4]
tests2 = s2 == [1,2,3,4]
tests3 = s3 == [1,2,3]
-}

{-
Problem 2 [List desugaring] Rewrite the following expressions so that they con-
tain the square brackets [ and ] only as list constructor [] (‘nil’).
d1 = [1 , 2 , 3]
d2 = [[1 , 2] , [] , [3 , 4]]
d3 = [[] , [ " a " ] , [[]]]
Hint: You can easily check your results in ghci as follows:
[ ’a ’ , ’b ’] == ’a ’ : ’b ’ : []

-}
--d1
[1 , 2 , 3] == 1 : 2: 3 : []
--d2
[[1 , 2] , [] , [3 , 4]] == (1:2:[]):[]:(3:4:[]):[]
--d3
[[] , [ " a " ] , [[]]]== []:(('a':[]):[]):[]:[]



{-
Problem 3 [Pattern Matching] Given are the following function and value de-
clarations. Give the type of each function and evaluate the expressions in the value
declarations. Give reasons for possible errors in types or pattern matching.
-}
f1 ( x : y : z ) = (x , y , z )
	[a] -> (a, a, [a])
f2 [x , y ] = (x , y)
  [a] -> (a, a)
f3 ( x : y : []) = (x , y )
 [a] -> (a, a)



a11 = f1 [] -> exception
a21 = f2 [] -> exception
a31 = f3 [] -> exception
a12 = f1 [1]
a22 = f2 [1]
a32 = f3 [1]
a13 = f1 [1 , 2] => (1,2,[])
a23 = f2 [1 , 2] => (1,2)
a33 = f3 [1 , 2] =>  (1,2)
a14 = f1 [1 , 2 , 3] (1,2, [3])
a24 = f2 [1 , 2 , 3] -> exception
a34 = f3 [1 , 2 , 3] -> exception
a15 = f1 (1 : 2 : 3 : [])  (1,2, [3])
a25 = f2 (1 : 2 : 3 : []) -> exception
a35 = f3 (1 : 2 : 3 : []) -> exception
a16 = f1 [ ’a ’ , ’b ’ , ’c ’] -> ('a', 'b', ['c'])
a17 = f1 [[1] , [2 , 3] , []] -> ([1], [2,3], [[]])
a18 = f1 (1 : 2 : 3 : [4 , 5]) -> ( 1, 2, [3,4,5])
a19 = f1 [1 .. 100]

f4 (x , y ) = [x , y ]
x41 = ([1 , 2] , [3 , 4 , 5])
a41 = f4 x41
g1 " dimdi " = 1
g1 [ ’d ’ , ’o ’ , ’m ’ , ’d ’ , ’o ’] = 2
g1 ( ’d ’ : ’i ’ : ’n ’ : ’g ’ : []) = 3
g1 ( ’d ’ : ’i ’ : ’n ’ : ’g ’ : _ ) = 4
g1 ( x : y ) = 5
g1 _ = 6
b11 = g1 " domdo "
b12 = g1 " ding "
b13 = g1 " dingdimdi "
2
b14 = g1 " dumdu "
b15 = g1 " "
g2 ( d : " imdi " )
| d == ’d ’ || d == ’D ’ = 1
g2 ( z : " umsel " )
| z == ’z ’ || z == ’Z ’ = 2
g2 _ = 3
b21 = g2 " dimdi "
b22 = g2 [ ’D ’ , ’i ’ , ’m ’ , ’d ’ , ’i ’]
b23 = g2 ( ’Z ’ : ’u ’ : " msel " )
b24 = g2 " dimdiding "
h1 [ ’a ’ , ’b ’] = ’a ’
h1 [ ’a ’ , b ] = b
h1 ( _ : _ : ’m ’ : _ ) = ’m ’
h1 ( a : b ) = a
c11 = h1 " ab "
c12 = h1 " ac "
c13 = h1 " dimdi "
c14 = h1 " zumsel "
c15 = h1 " schnurpsel "
h2 [( a , b ) , c ] = c
h2 ( a : b : c ) = a
c21 = h2 [(1 , 2) , (3 , 4)]
c22 = h2 [(1 , 2) , (3 , 4) , (5 , 6)]
c23 = h2 [(1 , 2)]
c24 = h2 [(1 , ’a ’) , (2 , ’b ’)]
h3 (( x : y ) : z ) = y
h3 ([] : _ ) = " 2 "
h3 [] = " 3 "
c31 = h3 [ " dimdi " ]
c32 = h3 [ " " , " dimdi " , " domdo " ]
c33 = h3 [[]]
c34 = h3 []


