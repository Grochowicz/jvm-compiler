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
    LITString {Token.LITString $$}
	ID  {Token.ID $$}
	OPAdd {Token.OPAdd}
	OPSub {Token.OPSub}
	OPMul {Token.OPMul}
	OPDiv {Token.OPDiv}
	OPAtrib {Token.OPAtrib}
	LPar {Token.LPar}
	RPar {Token.RPar}
    LBrace {Token.LBrace}
    RBrace {Token.RBrace}
	TInt {Token.TInt}
	TDouble {Token.TDouble}
	TVoid {Token.TVoid}
	TString {Token.TString}
	OPLt {Token.OPLt}
	OPGt {Token.OPGt}
	OPLe {Token.OPLe}
	OPGe {Token.OPGe}
	OPEq {Token.OPEq}
	OPNe {Token.OPNe}
	OPAnd {Token.OPAnd}
	OPOr {Token.OPOr}
	OPNot {Token.OPNot}
	KwIf {Token.KwIf}
	KwElse {Token.KwElse}
	KwWhile {Token.KwWhile}
	KwRead {Token.KwRead}
	KwPrint {Token.KwPrint}
	KwReturn {Token.KwReturn}
  KwFunction {Token.KwFunction}
  PVirg {Token.PVirg}
  Virg {Token.Virg}

%%

--Programa : Decls Bloco { AST.Prog $1 $2 }
--data Programa = Prog [ Funcao ] [( Id , [ Var ] , Bloco )] [ Var ] Bloco
--Impl : ID Decls Bloco { }
--Decl  : Type ListaId PVirg   { map (\i -> i :#: ($1, 0)) $2 }
--data Funcao = Id :->: ([ Var ] , Tipo ) deriving Show

Programa : Funcoes Decls Bloco {AST.Prog $1 $2 $3}

Decls : Decls Decl   { $1 ++ $2 }
      |							 { [] }

Decl  : Type ListaId PVirg   { map (\i -> i :#: ($1, 0)) $2 }



Bloco : LBrace BlocoAux RBrace { $2 }
BlocoAux : BlocoAux Comando { $1 ++ [$2] }
		  | { [] }


Comando : If { $1}
				| While { $1 }
				| Atrib { $1 }
				| Read { $1 }
				| Print { $1 }
				| Return { $1 }

If: KwIf LPar ExprL RPar Bloco KwElse Bloco {AST.If $3 $5 $7}

While : KwWhile LPar ExprL RPar Bloco {AST.While $3 $5}

Atrib : ID OPAtrib Expr PVirg {AST.Atrib $1 $3}

Read : KwRead LPar ID RPar PVirg {AST.Leitura $3}

Print : KwPrint LPar Expr RPar PVirg {AST.Imp $3}

Return : KwReturn Expr PVirg {AST.Ret (Just $2)}
			 | KwReturn PVirg {AST.Ret Nothing}

ExprL : ExprL OPAnd ExprL {AST.And $1 $3}
			| ExprL OPOr ExprL {AST.Or $1 $3}
			| OPNot ExprL {AST.Not $2}
			| ExprR {AST.Rel $1}

ExprR : Expr OPLt Expr {AST.Rlt $1 $3}
			| Expr OPGt Expr {AST.Rgt $1 $3}
			| Expr OPLe Expr {AST.Rle $1 $3}
			| Expr OPGe Expr {AST.Rge $1 $3}
			| Expr OPEq Expr {AST.Req $1 $3}
			| Expr OPNe Expr {AST.Rdif $1 $3}


Funcoes : Funcoes Funcao { $1 ++ [$2] }
        | { [] }

Funcao : KwFunction ID LPar Type RPar LPar Decls RPar PVirg { $2 :->: ($7, $4) }
--Funcao : Type ID LPar Decls RPar PVirg { $2 :->: ($4, $1) }


ListaId : ListaId Virg ID    { $1 ++ [$3] }
        | ID                 { [$1] }

Type	: TInt {AST.TInt}
	    | TDouble {AST.TDouble}
      | TString {AST.TString}
      | TVoid {AST.TVoid}

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
