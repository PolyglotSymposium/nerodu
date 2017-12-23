module Main

%default total

langName : String
langName = "AnythingGoesLang> "

partial
main : IO ()
main = repl langName (++ "\n")

