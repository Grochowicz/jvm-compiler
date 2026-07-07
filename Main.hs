module Main where

import qualified Lex as L
import Parser (calc)
import Semantico (verPrograma)
import Gerador (gerar)
import ErrorMonad
<<<<<<< HEAD
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  let arquivo = case args of { (a:_) -> a; [] -> "teste_menor.j--" }
  s <- readFile arquivo
=======
import Translator

main :: IO ()
main = do
  s <- readFile "teste/1teste.j--"
>>>>>>> 081c90c09c427720b6f4c24067e279ecfa5e076d
  let ast = calc (L.alexScanTokens s)
  let Result (temErro, msgs, astNova) = verPrograma ast
  putStr msgs
  if temErro
    then putStrLn "Erro na analise semantica."
    else do
      putStrLn "Analise semantica OK."
<<<<<<< HEAD
      let nome = "Programa"
      writeFile (nome ++ ".j") (gerar nome astNova)
      putStrLn ("Codigo gerado em " ++ nome ++ ".j")
=======
      print astNova 
      writeFile "output/astNova.txt" (show astNova)
  let assembly = gerar "Prog" astNova
  print assembly 
  writeFile "output/Prog.j" assembly
>>>>>>> 081c90c09c427720b6f4c24067e279ecfa5e076d
