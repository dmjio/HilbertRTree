module Main where

import Control.Monad (forever, when)
import System.Exit
import System.Environment
import Data.List
import Data.Char
import System.CPUTime
import RTree
import Hilbert
import Data
    
main :: IO ()
main = do 
  start <- getCPUTime
  file <- readFile "rects.txt"
  let rects = map constructRect $ lines file
  end <- getCPUTime
  print rects
  print $ "Read and constructed in " ++ show ((end - start) `quot` 1000000) ++ " milliseconds\n"
  return ()

                            






