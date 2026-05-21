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
    PVirg {Token.PVirg}
    Virg {Token.Virg}

%%
Decls : Decls Decl   { $1 ++ $2 }
      | Decl         { $1 }

Decl  : Type ListaId PVirg   { map (\i -> i :#: ($1, 0)) $2 }

ListaId : ListaId Virg ID    { $1 ++ [$3] }
        | ID                 { [$1] }

Type	: TInt {AST.TInt}
	    | TDouble {AST.TDouble}
        | TString {AST.TString}

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
