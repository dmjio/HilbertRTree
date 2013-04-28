module Tests where

import Test.QuickCheck
import Data
import RTree

-- | Test proper rectangle creation

input = "2628,3734,2628,3703,2743,3703,2743,3734"
testRect xs = constructRect xs == Rect {xlow = 2628, ylow = 3703, xhigh = 2743, yhigh = 3734, hv = 10016071}

--TODO: 
--After tree population ensure all rectangles accounted for in tree
--Bounds testing

main = do
  quickCheck $ testRect input






