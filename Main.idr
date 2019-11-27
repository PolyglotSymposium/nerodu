module Main

import Data.SortedMap

%default total

langName : String
langName = "LonelyLang> "

typeMap : SortedMap String String
typeMap = fromList $
  [ ("Void", "Type")
  , ("Type", "Type 1")
  ]

data Expr = Iden String

parseExpr : List Char -> Expr
parseExpr xs = Iden $ pack xs

printExpr : Expr -> String
printExpr (Iden x) =
  fromMaybe "ERROR: unrecognized value" $ map (\t => x ++ " : " ++ t) $ lookup x typeMap

data ReplCmd = TypeOf String

parseReplCmd : List Char -> Either String ReplCmd
parseReplCmd ('t' :: (' ' :: xs)) = Right $ TypeOf $ pack xs
parseReplCmd _ = Left "Unrecognized REPL command"

evalReplCmd : ReplCmd -> String
evalReplCmd (TypeOf name) =
  fromMaybe "ERROR: unrecognized type" $ lookup name typeMap

readEvalPrint : String -> String
readEvalPrint = readEvalPrint_ . unpack where
  readEvalPrint_ : List Char -> String
  readEvalPrint_ [] = ""
  readEvalPrint_ (':' :: xs) = either id evalReplCmd $ parseReplCmd xs
  readEvalPrint_ (x :: xs) = printExpr $ parseExpr (x :: xs)


partial
main : IO ()
main = repl langName ((++ "\n") . readEvalPrint)

