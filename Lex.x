{
module Lex where

import Token
}

%wrapper "basic"

$digit = [0-9]          -- digits
$letter = [A-Za-z]
@id = $letter($letter|$digit|_|')* 
@num = $digit+(\.$digit+)?

tokens :-

<0> $white+ ;
<0> @num  {\s -> NUM (read s)}
<0> "let" {\s -> LET}
<0> "in"  {\s -> IN}
<0> @id   {\s -> ID s}
<0> "="   {\s -> ASSIGN}
<0> "+"   {\s -> ADD}  
<0> "-"   {\s -> SUB}  
<0> "*"   {\s -> MUL}  
<0> "/"   {\s -> DIV}  
<0> "("   {\s -> LPAR}  
<0> ")"   {\s -> RPAR}  

{
-- As acoes tem tipo :: String -> Token

testLex = do s <- getLine
             print (alexScanTokens s)
}
