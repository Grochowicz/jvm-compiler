module Main where

import qualified Lex as L
import Parser (calc)
import Semantico (verPrograma)
import ErrorMonad
import Translator

main :: IO ()
main = do
  s <- readFile "teste/1teste.j--"
  let ast = calc (L.alexScanTokens s)
  let Result (temErro, msgs, astNova) = verPrograma ast
  putStr msgs
  if temErro
    then putStrLn "Erro na analise semantica."
    else do
      putStrLn "Analise semantica OK."
      print astNova 
      writeFile "output/astNova.txt" (show astNova)
  let assembly = gerar "Prog" astNova
  print assembly 
  writeFile "output/Prog.j" assembly
