module Codes (randomCodes, splitIntoCodeAndWordPair) where

import Control.Monad (replicateM)
import Data.List (intercalate)
import System.Random (randomRIO)
import Utility (asStrings)

-- | Generates a random numeric code of a given length
randomCode :: Int -> IO Int
randomCode size = do
  rndNumbers <- replicateM size $ randomRIO (1, 6)
  let code = intercalate "" (asStrings rndNumbers)
  return (read code :: Int)

-- | Returns an array of random 5-digit codes
randomCodes :: Int -> IO [Int]
randomCodes count = do
  replicateM count (randomCode 5)

-- | Given list containing a numeric code string followed by a word, returns a code-word pair
pairCodeAndWord :: [String] -> (Int, String)
pairCodeAndWord (code : word : _) = (read code :: Int, word)
pairCodeAndWord _ = error "Could not split line into code and word"

-- | Splits string containing a numeric code and a word into a code-word pair
splitIntoCodeAndWordPair :: String -> (Int, String)
splitIntoCodeAndWordPair = pairCodeAndWord . words