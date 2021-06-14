module Arguments (getPhraseLengthArgOr, getSeparatorArgOr) where

import System.Environment (getArgs)

-- | Returns phrase length CLI argument or default value
getPhraseLengthArgOr :: Int -> IO Int
getPhraseLengthArgOr defaultValue = do
  args <- getArgs
  return $ case args of
    (arg : _) -> read arg :: Int
    _ -> defaultValue

-- | Returns separator CLI argument or default value
getSeparatorArgOr :: String -> IO String
getSeparatorArgOr defaultValue = do
  args <- getArgs
  return $ case args of
    (_ : arg : _) -> arg
    _ -> defaultValue