{
module Lex where

import Token
}

%wrapper "basic"

$digit = [0-9]          -- digits
$letter = [A-Za-z]
--@id = $letter($letter|$digit|_|')* 
@id = $letter [$letter $digit _ ']*

-- nao separa entre int e double
@literal_int = ($digit)+
@literal_double = $digit+(\.$digit+)? -- nao permite .3 -> 0.3

tokens :-

<0> "int" {\s -> TInt} 
<0> "double" {\s -> TDouble} 
<0> "void" {\s -> TVoid} 
<0> "string" {\s -> TString} 
<0> $white+ ;
<0> @id   {\s -> ID s}

<0> @literal_int {\s -> LITInt (read s)}
<0> @literal_double {\s -> LITDouble (read s)}

<0> "="   {\s -> OPAtrib}
<0> "+"   {\s -> OPAdd}  
<0> "-"   {\s -> OPSub}  
<0> "*"   {\s -> OPMul}  
<0> "/"   {\s -> OPDiv}  

<0> "("   {\s -> LPar}  
<0> ")"   {\s -> RPar}  

<0> ";"   {\s -> PVirg}
<0> ","   {\s -> Virg}




--<0> "if" {\s -> }


{
-- As acoes tem tipo :: String -> Token

testLex = do s <- getLine
             print (alexScanTokens s)
}
