module Eval where

import AST

tabSim [] s = error $ "tabSim: Variavel " ++ s ++ " nao definida\n" 
tabSim (i:#:d:vs) s = if i == s then d else  tabSim vs s

eval tab (Var v)       = tabSim tab v
eval tab (Const d)     = d 
eval tab (Add e1 e2)   = eval tab e1 + eval tab e2 
eval tab (Sub e1 e2)   = eval tab e1 - eval tab e2 
eval tab (Mul e1 e2)   = eval tab e1 * eval tab e2 
eval tab (Div e1 e2)   = eval tab e1 / eval tab e2
eval tab (Let i e1 e2) = eval (i:#:eval tab e1:tab) e2  

