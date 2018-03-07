module Main where
import System.Environment

getFileNameFromArgs :: IO FilePath
getFileNameFromArgs = do
  args <- getArgs
  case args of
    (arg:_) -> return arg
    _ -> fail "expected argument"

countLines :: String -> Int
countLines str = length $ lines str


main :: IO ()
main = do
  filename <- getFileNameFromArgs
  putStrLn $ "wc -l " ++ filename
  contents <- readFile filename
  putStrLn $ "lines: " ++ show (countLines contents)

