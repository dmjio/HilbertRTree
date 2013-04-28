module Main where

import Control.Monad
import System.Exit
import System.Environment
import Data.List
import Data.Char
import System.CPUTime
import RTree
import Hilbert
    
main :: IO ()
main = do 
  start <- getCPUTime
  file <- readFile "rects.txt"
  let rects = map hv $ lines file
  print rects
  end <- getCPUTime
  
  putStr ("Read and constructed in " ++ show ((end - start) `quot` 1000000) ++ " milliseconds\n")
  -- forever $ do
  --   putStr ">>> "
  --   line <- getLine
  --   when (null line) exitSuccess
  --   putStrLn $ ">>> " ++ line
  return ()

