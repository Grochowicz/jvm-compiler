module Token where

data Token
  = NUM Double
  | ID String
  | LET
  | IN
  | ADD
  | SUB
  | MUL
  | DIV
  | LPAR
  | RPAR
  | ASSIGN
  deriving (Eq, Show)
  
