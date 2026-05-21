module Token where



data Token
  = LITInt Integer
  | LITDouble Double
  | ID String
  | OPAdd
  | OPSub
  | OPMul
  | OPDiv
  | OPAtrib
  | LPar
  | RPar
  | TInt 
  | TDouble
  | TVoid
  | TString
  | PVirg
  | Virg
  deriving (Eq, Show)
  
