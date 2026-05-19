{
module Parser where

import Token
import AST
--import Eval
import qualified Lex as L

}


%name calc
%tokentype { Token }
%error { parseError }
%token 
	LITInt {Token.LITInt $$}
	LITDouble {Token.LITDouble $$}
	ID  {Token.ID $$}
	OPAdd {Token.OPAdd}
	OPSub {Token.OPSub}
	OPMul {Token.OPMul}
	OPDiv {Token.OPDiv}
	OPAtrib {Token.OPAtrib}
	LPar {Token.LPar}
	RPar {Token.RPar}
	TInt {Token.TInt}
	TDouble {Token.TDouble}
	TVoid {Token.TVoid}
	TString {Token.TString}

%%
Decl	: Type ID OPAtrib LITInt {$2 :#: ($1, $4)}

Type	: TInt {$1}
			| TDouble {$1}

Exp   : Expr {$1} 

Expr  : Expr OPAdd Term       {AST.Add $1 $3}
      | Expr OPSub Term       {AST.Sub $1 $3}
      | Term                {$1}

Term  : Term  OPMul Factor    {AST.Mul $1 $3}
      | Term OPDiv Factor     {AST.Div $1 $3}
      | Factor              {$1}

Factor : LITInt                {AST.Const (AST.CInt $1)}
       | LITDouble                 {AST.Const (AST.CDouble $1)}
       | ID                 {AST.IdVar $1}
       | LPar Expr RPar       {$2}      


{
parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do putStr "Expressão:"
          s <- getLine
          let a = calc (L.alexScanTokens s)
          print a
          -- print (eval [] a)
}
