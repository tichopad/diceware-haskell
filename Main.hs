module Main (main) where

import Arguments (getPhraseLengthArgOr, getSeparatorArgOr)
import Codes (randomCodes, splitIntoCodeAndWordPair)
import Data.List (intercalate)
import Data.Maybe (catMaybes)
import Utility (asStrings, lookupMultiple)

main :: IO ()
main = do
  -- Number of words in a phrase
  phraseLength <- getPhraseLengthArgOr 5
  -- A character separating words in a phrase
  separator <- getSeparatorArgOr " "
  -- Words' source file
  fileContents <- readFile "wordlist.txt"
  -- Random "dice-rolled" codes
  codes <- randomCodes phraseLength

  let randomWords = catMaybes $ lookupMultiple codes $ map splitIntoCodeAndWordPair $ lines fileContents

  putStrLn $ "Generated codes: " ++ unwords (asStrings codes)
  putStrLn $ "Passphrase: " ++ intercalate separator randomWords