module Utility where

-- | Maps a list of numbers into a list of strings
asStrings :: [Int] -> [String]
asStrings = map show

-- | Given keys and key-value pairs, looks up values by keys
lookupMultiple :: Eq a => [a] -> [(a, b)] -> [Maybe b]
lookupMultiple keys keyPairs = map (`lookup` keyPairs) keys