module RTree where
    

-- | Constructs an R-Tree from a text file (See http://www.scs.stanford.edu/11au-cs240h/labs/rects.txt for an example input file)

import Data
import Hilbert 
import Data.List hiding (insert)
import Data.Maybe (fromJust)
import Data.List.Split (splitOn)

--to construct a tree we must do the following:
   -- for each line, create a rectangle for that line
   -- determine the hilbert value for each rectangle

constructTree :: [String] -> HRTree
constructTree = undefined

--http://packdeps.haskellers.com/reverse/split
--Data.List.Split will be included in the next version of Haskell Platform release

samp = "3536,6555,3536,6530,3760,6530,3760,6555"

sanitize = filter (/= "")

strToInts :: [String] -> [Int]
strToInts = map read 

-- |Construct a rectangle from a string
constructRect :: String -> Rect
constructRect xxs = let res = strToInts $ splitOn "," xxs
                        (xs,ys) = partition (\x -> (even . fromJust) $ elemIndex x res) res
                    in Rect (minimum xs) (minimum ys) (maximum xs) (maximum ys)

-- |Finds out wether one rectangle intersects another rectangle
intersect (Rect axl ayl axh ayh) (Rect bxl byl bxh byh) =
  axl < bxl && ayl < byl && axh < bxh && ayh < byh

-- | The Hilbert value of a rectangle is defined as the Hilbert value of its center
rectHV :: Rect -> Int
rectHV (Rect xl yl xh yh) = hilbertValue dimension ((xl+xh) `div` 2, (yl+yh) `div` 2)

-- |Insertion into RTree
insert :: HRTree -> Rect -> HRTree 
insert tree rect = case tree of 
  Empty -> Leaf (rectHV rect) rect 
  Leaf ->  

-- |retrieve hilbert value from a string -> rect
hv = rectHV . constructRect 


test = constructRect samp



