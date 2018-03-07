module Main (main) where

import System.Environment

getFilename :: IO String
getFilename = do
  args <- getArgs
  case args of
    (arg:_) -> return arg
    _ -> fail "missing arg"

main :: IO ()
main = do
  fname <- getFilename
  putStrLn $ "processing " ++ fname
  contents <- readFile fname
  putStrLn $ "lines: " ++ show (length $ lines contents)
  putStrLn $ "words: " ++ show (length $ words contents)
