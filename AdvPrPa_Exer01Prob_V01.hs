module Exer01Prob where

-- Develop some functions to work with two-dimensional vectors,
-- using pairs, including pair patterns.

toBeImplemented = undefined

-- a type for two-dimensional vectors
type Vec = (Double, Double)

-- the zero vector
zeroVec :: Vec
zeroVec = (0, 0)

-- some example vectors
a, b, c, d :: Vec
a = (3, 0)
b = (0, 4)
c = (sqrt2, sqrt2)
      where sqrt2 = sqrt 2
d = (3, 4)

-- lengthVec computes the length of a vector.
exaLengthVec =
  lengthVec a == 3 && lengthVec c == 2

lengthVec :: Vec -> Double
lengthVec (x, y) = x^2 + y^2

-- negVec negates a vector.
exaNegVec =
  negVec d == (-3, -4)

negVec :: Vec -> Vec
negVec (x, y) = toBeImplemented

-- negVecCurry negates a vector, but uses currying.
-- Note: this is a bad use of currying, since
-- the two components of a vector belong together.
exaNegVecCurry =
  negVecCurry (fst d) (snd d) == (-3, -4)

negVecCurry :: Double -> Double -> Vec
negVecCurry = toBeImplemented

-- addVec adds two vectors.
exaAddVec =
  a `addVec` b == d

addVec :: Vec -> Vec -> Vec
addVec = toBeImplemented

-- subVec subtracts two vectors.
exaSubVec =
  a `subVec` b == (3, -4)
-- Implement this function using negVec and addVec.

subVec :: Vec -> Vec -> Vec
subVec = toBeImplemented

-- subVecCurry subtracts two vectors.
-- Implement this function using negVecCurry and addVec.
-- Note: this example clearly demonstrates the bad use
-- of currying in negVecCurry.
-- The two components of a vector simply belong together.
exaSubVecCurry =
  a `subVecCurry` b == (3, -4)

subVecCurry :: Vec -> Vec -> Vec
subVecCurry = toBeImplemented

-- distance computes the distance between two vectors.
exaDistance =
  distance a d == 4
-- Implement this function using subVec and lengthVec.

distance :: Vec -> Vec -> Double
distance = toBeImplemented

-- Scales a vector with a factor.
exaScaleVec =
  scaleVec d 3 == (9, 12)

scaleVec :: Vec -> Double -> Vec
scaleVec = toBeImplemented
