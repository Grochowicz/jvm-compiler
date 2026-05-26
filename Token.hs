module Token where

data Token
  = LITInt Integer
  | LITDouble Double
  | LITString String
  | ID String
  -- aritmética
  | OPAdd
  | OPSub
  | OPMul
  | OPDiv
  | OPAtrib
  -- relação
  | OPLt        -- <
  | OPGt        -- >
  | OPLe        -- <=
  | OPGe        -- >=
  | OPEq        -- ==
  | OPNe        -- /=
  -- lógica
  | OPAnd       -- &&
  | OPOr        -- ||
  | OPNot       -- !
  -- parentesis etc
  | LPar
  | RPar
  | LBrace
  | RBrace
  -- tipos
  | TInt
  | TDouble
  | TVoid
  | TString
  -- pontuação
  | PVirg
  | Virg
  -- keywords
  | KwIf
  | KwElse
  | KwWhile
  | KwReturn
  | KwPrint
  | KwRead
  | KwFunction
  deriving (Eq, Show)
