module Main

%default total

langName : String
langName = "LonelyAlone> "

data ReplCmd = TypeOf String

parseLine : List Char -> String
parseLine xs = "TODO"

parseReplCmd : List Char -> Either String ReplCmd
parseReplCmd ('t' :: (' ' :: xs)) = Right $ TypeOf $ pack xs
parseReplCmd _ = Left "Unrecognized REPL command"

evalReplCmd : ReplCmd -> String
evalReplCmd (TypeOf "Void") = "Type"
evalReplCmd (TypeOf "Type") = "Type 1"
evalReplCmd (TypeOf _) = "ERROR: Type Unrecognized"

readEvalPrint : String -> String
readEvalPrint = readEvalPrint_ . unpack where
  readEvalPrint_ : List Char -> String
  readEvalPrint_ [] = ""
  readEvalPrint_ (':' :: xs) = either id evalReplCmd $ parseReplCmd xs
  readEvalPrint_ (x :: xs) = parseLine (x :: xs)


partial
main : IO ()
main = repl langName ((++ "\n") . readEvalPrint)

