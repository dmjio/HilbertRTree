module Data where

dimension, siblings, capacity :: Int
dimension = 16
siblings = 2
capacity = 10

type LHV = Int
type ObjID = String 

data Rect = Rect { xlow, ylow, xhigh, yhigh :: Int }
            deriving (Show, Ord, Eq)

data HRTree = Node { lhv :: LHV, rect :: Rect, children :: [HRTree] }
            | Leaf { lhv :: LHV, rect :: Rect }
            | Empty
            deriving (Show)


