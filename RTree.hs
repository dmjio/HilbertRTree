module RTree where

-- | Constructs an R-Tree from a text file (See http://www.scs.stanford.edu/11au-cs240h/labs/rects.txt for an example input file)
import Data
import Hilbert 
import Data.Function
import Data.List hiding (intersect)
import Data.Maybe (fromJust)
import Data.List.Split (splitOn)

--http://packdeps.haskellers.com/reverse/split
--Data.List.Split will be included in the next version of Haskell Platform release

-- |Construct a rectangle from a string
constructRect :: String -> Rect
constructRect xxs = let res = strToInts $ splitOn "," xxs
                        (xs,ys) = partition (\x -> (even . fromJust) $ elemIndex x res) res
                        partial = Rect (minimum xs) (minimum ys) (maximum xs) (maximum ys)
                    in  partial (rectHV $ partial 0) where
                        strToInts :: [String] -> [Int]
                        strToInts = map read 

-- |Finds out wether one rectangle intersects another rectangle
intersect (Rect axl ayl axh ayh _) (Rect bxl byl bxh byh _) =
  axl < bxl && ayl < byl && axh < bxh && ayh < byh

-- | The Hilbert value of a rectangle is defined as the Hilbert value of its center
rectHV :: Rect -> Int
rectHV (Rect xl yl xh yh _ ) = hilbertValue dimension ((xl+xh) `div` 2, (yl+yh) `div` 2)

-- |Contruct RTree
-- to construct a tree we must do the following:
-- for each line, create a rectangle for that line
-- determine the hilbert value for each rectangle
makeHRTree :: [Rect] -> HRTree
makeHRTree (x:xs) = undefined

-- | Search function            
searchTree :: HRTree -> Rect -> [Rect]
searchTree Empty query = []
searchTree (Node _ _ contents) query =  concat [searchTree child query | child <- contents, intersect query (rect child)]
searchTree (Leaf _ r) query = [r]


