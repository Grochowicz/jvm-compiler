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
  PVirg {Token.PVirg}
  Virg {Token.Virg}

%%

Programa : Funcoes BlocoPrincipal { AST.Prog (map fst $1) (map snd $1) (fst $2) (snd $2) }
         | BlocoPrincipal         { AST.Prog [] [] (fst $1) (snd $1) }

Funcoes : Funcoes Funcao { $1 ++ [$2] }
        | Funcao         { [$1] }

Funcao : TypeRet ID LPar DeclsParam RPar BlocoPrincipal
           { ($2 :->: ($4, $1), ($2, $4 ++ fst $6, snd $6)) }
       | TypeRet ID LPar RPar BlocoPrincipal
           { ($2 :->: ([], $1), ($2, fst $5, snd $5)) }

TypeRet : Type { $1 }
        | TVoid { AST.TVoid }

DeclsParam : DeclsParam Virg DeclParam  { $1 ++ [$3] }
           | DeclParam { [$1] }

DeclParam : Type ID { $2 :#: ($1, 0)}

BlocoPrincipal : LBrace Decls ListaCmd RBrace { ($2, $3) }
      | LBrace ListaCmd RBrace { ([], $2) }



Decls : Decls Decl { $1 ++ $2 }
      | Decl { $1 }

Decl  : Type ListaId PVirg { map (\i -> i :#: ($1, 0)) $2 }

Type	: TInt {AST.TInt}
	    | TDouble {AST.TDouble}
        | TString {AST.TString}

ListaId : ListaId Virg ID    { $1 ++ [$3] }
        | ID                 { [$1] }

Bloco : LBrace ListaCmd RBrace { $2 }

ListaCmd : ListaCmd Comando { $1 ++ [$2] }
		  | Comando { [$1] }


Comando :   If { $1}
            | While { $1 }
            | Atrib { $1 }
            | Read { $1 }
            | Print { $1 }
            | Return { $1 }
            | ID LPar Args RPar PVirg  { AST.Proc $1 $3 }
            | ID LPar RPar PVirg       { AST.Proc $1 [] }

If: KwIf LPar ExprL RPar Bloco {AST.If $3 $5 []}
    | KwIf LPar ExprL RPar Bloco KwElse Bloco {AST.If $3 $5 $7}

While : KwWhile LPar ExprL RPar Bloco {AST.While $3 $5}

Atrib : ID OPAtrib Expr PVirg {AST.Atrib $1 $3}

Print : KwPrint LPar Expr RPar PVirg {AST.Imp $3}
      | KwPrint LPar LITString RPar PVirg {AST.Imp (AST.Lit $3) }


Read : KwRead LPar ID RPar PVirg {AST.Leitura $3}

Return : KwReturn Expr PVirg {AST.Ret (Just $2)}
         | KwReturn LITString PVirg {AST.Ret (Just (AST.Lit $2))}
         | KwReturn PVirg {AST.Ret Nothing}

ChamadaProc : ChamadaFuncao PVirg { $1 }

ChamadaFuncao : ID LPar Args RPar { AST.Chamada $1 $3 }
              | ID LPar RPar { AST.Chamada $1 [] }

Args : Args Virg Expr        { $1 ++ [$3] }
     | Args Virg LITString   { $1 ++ [AST.Lit $3] }
     | Expr                  { [$1] }
     | LITString             { [AST.Lit $1] }


-- daqui pra baixo é estranho

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


Expr  : Expr OPAdd Term       {AST.Add $1 $3}
      | Expr OPSub Term       {AST.Sub $1 $3}
      | Term                {$1}

Term  : Term  OPMul Factor    {AST.Mul $1 $3}
      | Term OPDiv Factor     {AST.Div $1 $3}
      | Factor              {$1}

Factor : LITInt              { AST.Const (AST.CInt $1) }
       | LITDouble           { AST.Const (AST.CDouble $1) }
       | ID                  { AST.IdVar $1 }
       | ID LPar Args RPar   { AST.Chamada $1 $3 }
       | ID LPar RPar        { AST.Chamada $1 [] }
       | LPar Expr RPar      { $2 }

{
parseError :: [Token] -> a
parseError s = error ("Parse error: " ++ show s)

--main :: IO ()
--main = do
--  s <- readFile "test_menor.j--"
--  print (calc (L.alexScanTokens s))
--}
