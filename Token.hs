module Token where

data Token
  = LITInt Integer
  | LITDouble Double
  | LITString String
  | ID String
  -- aritmética
  | OPMinusEq
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
  | KwDo
  deriving (Eq, Show)
  -- | KwFunction
