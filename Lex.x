{
module Lex where

import Token
}

%wrapper "basic"

$digit = [0-9]
$letter = [A-Za-z]
@id = $letter [$letter $digit _ ']*

-- nao separa entre int e double
@literal_int = ($digit)+
@literal_double = $digit+(\.$digit+)? -- nao permite .3 -> 0.3
@literal_string = \" [^\"]* \"

tokens :-
<0> $white+ ;

<0> "int" {\s -> TInt} 
<0> "double" {\s -> TDouble} 
<0> "void" {\s -> TVoid} 
<0> "string" {\s -> TString} 
<0> "if"      {\s -> KwIf}
<0> "else"    {\s -> KwElse}
<0> "while"   {\s -> KwWhile}
<0> "return"  {\s -> KwReturn}
<0> "print"   {\s -> KwPrint}
<0> "read"    {\s -> KwRead}

<0> @id   {\s -> ID s}

<0> @literal_int {\s -> LITInt (read s)}
<0> @literal_double {\s -> LITDouble (read s)}
<0> @literal_string {\s -> LITString (init (tail s))}

<0> "<="  {\s -> OPLe}
<0> ">="  {\s -> OPGe}
<0> "=="  {\s -> OPEq}
<0> "/="  {\s -> OPDif}
<0> "<"   {\s -> OPLt}
<0> ">"   {\s -> OPGt}

<0> "&&"  {\s -> OPAnd}
<0> "||"  {\s -> OPOr}
<0> "!"   {\s -> OPNot}


<0> "="   {\s -> OPAtrib}
<0> "+"   {\s -> OPAdd}  
<0> "-"   {\s -> OPSub}  
<0> "*"   {\s -> OPMul}  
<0> "/"   {\s -> OPDiv}  

<0> "("   {\s -> LPar}  
<0> ")"   {\s -> RPar}  
<0> "{"   {\s -> LBrace}
<0> "}"   {\s -> RBrace}

<0> ";"   {\s -> PVirg}
<0> ","   {\s -> Virg}



{
-- As acoes tem tipo :: String -> Token

testLex = do s <- getLine
             print (alexScanTokens s)
}
