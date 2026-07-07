module Main where

import qualified Lex as L
import Parser (calc)
import Semantico (verPrograma)
import Gerador (gerar)
import ErrorMonad
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  let arquivo = case args of { (a:_) -> a; [] -> "teste_menor.j--" }
  s <- readFile arquivo
  let ast = calc (L.alexScanTokens s)
  let Result (temErro, msgs, astNova) = verPrograma ast
  putStr msgs
  if temErro
    then putStrLn "Compilacao abortada: erros de tipo."
    else do
      putStrLn "Analise semantica OK."
      let nome = "Programa"
      writeFile (nome ++ ".j") (gerar nome astNova)
      putStrLn ("Codigo gerado em " ++ nome ++ ".j")
