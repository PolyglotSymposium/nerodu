module Main

%default total

langName : String
langName = "LonelyAloneLang> "

data Token = TokEq | TokColon | TokId String

tokenize : List Char -> List Token

data LangType = TypeType | VoidType

data LangVal = TypeAsVal LangType

data AST = TypeDecl String LangType | ValAssn String LangVal

parseWord : List Token -> AST
parseWord xs = ?todo

parseLine : List Token -> AST
parseLine xs = ?todo2

printAst : AST -> String

data ReplCmd = TypeOf String

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
  readEvalPrint_ (x :: xs) = printAst $ parseLine $ tokenize (x :: xs)


partial
main : IO ()
main = repl langName ((++ "\n") . readEvalPrint)

