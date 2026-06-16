module Main where

import qualified Lex as L
import Parser (calc)
import Semantico (verPrograma)
import ErrorMonad

main :: IO ()
main = do
  s <- readFile "teste_menor.j--"
  let ast = calc (L.alexScanTokens s)
  let Result (temErro, msgs, astNova) = verPrograma ast
  putStr msgs
  if temErro
    then putStrLn "Compilacao abortada: erros de tipo."
    else do
      putStrLn "Analise semantica OK."
      print astNova 
