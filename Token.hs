module Token where

data Token
  = LITInt Integer
  | LITDouble Double
  | LITString String       -- NEW: string literals like "hello"
  | ID String
  -- Arithmetic operators
  | OPAdd
  | OPSub
  | OPMul
  | OPDiv
  | OPAtrib
  -- Relational operators (NEW)
  | OPLt        -- 
  | OPGt        -- >
  | OPLe        -- <=
  | OPGe        -- >=
  | OPEq        -- ==
  | OPDif       -- /=
  -- Logical operators (NEW)
  | OPAnd       -- &&
  | OPOr        -- ||
  | OPNot       -- !
  -- Delimiters
  | LPar
  | RPar
  | LBrace      -- NEW: {
  | RBrace      -- NEW: }
  -- Types
  | TInt
  | TDouble
  | TVoid
  | TString
  -- Punctuation
  | PVirg
  | Virg
  -- Keywords (NEW)
  | KwIf
  | KwElse
  | KwWhile
  | KwReturn
  | KwPrint
  | KwRead
  deriving (Eq, Show)
