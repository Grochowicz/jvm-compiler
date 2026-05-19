{
module Parser where

import Token
import AST
import Eval
import qualified Lex as L

}


%name calc
%tokentype { Token }
%error { parseError }
%token 
  let {LET}
  in  {IN}
  '+' {ADD}
  '-' {SUB}
  '*' {MUL}
  '/' {DIV}
  '(' {LPAR}
  ')' {RPAR}
  '=' {ASSIGN}
  Num {NUM $$}
  Id  {ID $$}


%%
Exp   : let Id '=' Expr in Exp {Let $2 $4 $6} 
      | Expr {$1} 

Expr  : Expr '+' Term       {Add $1 $3}
      | Expr '-' Term       {Sub $1 $3}
      | Term                {$1}

Term  : Term  '*' Factor    {Mul $1 $3}
      | Term '/' Factor     {Div $1 $3}
      | Factor              {$1}

Factor : Num                {Const $1}
       | Id                 {Var $1}
       | '(' Expr ')'       {$2}      


{
parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do putStr "Expressão:"
          s <- getLine
          let a = calc (L.alexScanTokens s)
          print a
          print (eval [] a)
}
