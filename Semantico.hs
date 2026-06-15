module Semantico where

import AST
import ErrorMonad
import Data.List (nub, (\\))

lookupVar :: Id -> [Var] -> Maybe Tipo
lookupVar _ [] = Nothing
lookupVar x ((v :#: (t, _)) : vs)
  | x == v    = Just t
  | otherwise = lookupVar x vs

lookupFun :: Id -> [Funcao] -> Maybe ([Var], Tipo)
lookupFun _ [] = Nothing
lookupFun x ((f :->: sig) : fs)
  | x == f    = Just sig
  | otherwise = lookupFun x fs

verExpr :: [Funcao] -> [Var] -> Expr -> Result (Tipo, Expr)
verExpr _ _ (Const (CInt n))    = pure (TInt,    Const (CInt n))
verExpr _ _ (Const (CDouble n)) = pure (TDouble, Const (CDouble n))
verExpr _ _ (Lit s)             = pure (TString, Lit s)
verExpr _ l (IdVar x) =
  case lookupVar x l of
    Just t  -> pure (t, IdVar x)
    Nothing -> do
      errorMsg ("variavel '" ++ x ++ "' nao declarada")
      pure (TInt, IdVar x)        -- tipo "chute"(??) 

verExpr g l (Add e1 e2) = verBin g l e1 e2 Add
verExpr g l (Sub e1 e2) = verBin g l e1 e2 Sub
verExpr g l (Mul e1 e2) = verBin g l e1 e2 Mul
verExpr g l (Div e1 e2) = verBin g l e1 e2 Div
verExpr g l (Chamada f args) =
  case lookupFun f g of
    Nothing -> do errorMsg ("funcao '" ++ f ++ "' nao declarada"); pure (TInt, Chamada f args)
    Just (formais, tret) -> do
      args' <- verArgs g l f formais args
      pure (tret, Chamada f args')
verExpr g l (Neg e) = do
  (t, e') <- verExpr g l e
  case t of
    TString -> do errorMsg "operador '-' aplicado a string"; pure (t, Neg e')
    _       -> pure (t, Neg e')
verExpr g l (IntDouble e) = do { (_, e') <- verExpr g l e; pure (TDouble, IntDouble e') }
verExpr g l (DoubleInt e) = do { (_, e') <- verExpr g l e; pure (TInt, DoubleInt e') }



verBin :: [Funcao] -> [Var] -> Expr -> Expr -> (Expr -> Expr -> Expr) -> Result (Tipo, Expr)
verBin g l e1 e2 op = do
  (t1, e1') <- verExpr g l e1
  (t2, e2') <- verExpr g l e2
  case (t1, t2) of
    (TInt,    TInt)    -> pure (TInt,    op e1' e2')
    (TDouble, TDouble) -> pure (TDouble, op e1' e2')
    (TInt,    TDouble) -> pure (TDouble, op (IntDouble e1') e2')   
    (TDouble, TInt)    -> pure (TDouble, op e1' (IntDouble e2'))   
    _ -> do
      errorMsg ("operacao aritmetica com tipos incompativeis: "
                ++ show t1 ++ " e " ++ show t2)
      pure (TInt, op e1' e2')



verExprR :: [Funcao] -> [Var] -> ExprR -> Result ExprR
verExprR g l (Req  e1 e2) = verRel g l e1 e2 Req
verExprR g l (Rdif e1 e2) = verRel g l e1 e2 Rdif
verExprR g l (Rlt  e1 e2) = verRel g l e1 e2 Rlt
verExprR g l (Rgt  e1 e2) = verRel g l e1 e2 Rgt
verExprR g l (Rle  e1 e2) = verRel g l e1 e2 Rle
verExprR g l (Rge  e1 e2) = verRel g l e1 e2 Rge

verRel :: [Funcao] -> [Var] -> Expr -> Expr -> (Expr -> Expr -> ExprR) -> Result ExprR
verRel g l e1 e2 op = do
  (t1, e1') <- verExpr g l e1
  (t2, e2') <- verExpr g l e2
  case (t1, t2) of
    (TString, TString) -> pure (op e1' e2')
    (TString, _) -> do
      errorMsg ("comparacao de string com " ++ show t2)
      pure (op e1' e2')
    (_, TString) -> do
      errorMsg ("comparacao de " ++ show t1 ++ " com string")
      pure (op e1' e2')
    (TInt,    TInt)    -> pure (op e1' e2')
    (TDouble, TDouble) -> pure (op e1' e2')
    (TInt,    TDouble) -> pure (op (IntDouble e1') e2')
    (TDouble, TInt)    -> pure (op e1' (IntDouble e2'))
    _ -> do
      errorMsg ("comparacao com tipos incompativeis: " ++ show t1 ++ " e " ++ show t2)
      pure (op e1' e2')


verExprL :: [Funcao] -> [Var] -> ExprL -> Result ExprL
verExprL g l (And a b) = do { a' <- verExprL g l a; b' <- verExprL g l b; pure (And a' b') }
verExprL g l (Or  a b) = do { a' <- verExprL g l a; b' <- verExprL g l b; pure (Or  a' b') }
verExprL g l (Not a)   = do { a' <- verExprL g l a; pure (Not a') }
verExprL g l (Rel r)   = do { r' <- verExprR g l r; pure (Rel r') }


coerceTo :: String -> Tipo -> Tipo -> Expr -> Result Expr
coerceTo ctx alvo fonte e = case (alvo, fonte) of
  (TString, TString) -> pure e
  (TInt,    TInt)    -> pure e
  (TDouble, TDouble) -> pure e
  (TDouble, TInt)    -> pure (IntDouble e)                 
  (TInt,    TDouble) -> do                              
    warningMsg (ctx ++ ": double convertido para int (perda de precisao)")
    pure (DoubleInt e)
  _ -> do
    errorMsg (ctx ++ ": tipos incompativeis (" ++ show alvo ++ " <- " ++ show fonte ++ ")")
    pure e

verComando :: [Funcao] -> Tipo -> [Var] -> Comando -> Result Comando

verComando g _ l (Atrib x e) =
  case lookupVar x l of
    Nothing -> do errorMsg ("variavel '" ++ x ++ "' nao declarada"); pure (Atrib x e)
    Just tv -> do
      (te, e') <- verExpr g l e
      e'' <- coerceTo ("atribuicao a '" ++ x ++ "'") tv te e'
      pure (Atrib x e'')

verComando _ _ l (Leitura x) =
  case lookupVar x l of
    Just _  -> pure (Leitura x)
    Nothing -> do errorMsg ("variavel '" ++ x ++ "' nao declarada (leitura)"); pure (Leitura x)

verComando g _ l (Imp e) = do { (_, e') <- verExpr g l e; pure (Imp e') }

verComando g ret l (If c b1 b2) = do
  c'  <- verExprL g l c
  b1' <- verBloco g ret l b1
  b2' <- verBloco g ret l b2
  pure (If c' b1' b2')

verComando g ret l (While c b) = do
  c' <- verExprL g l c
  b' <- verBloco g ret l b
  pure (While c' b')

verComando _ ret _ (Ret Nothing) =
  case ret of
    TVoid -> pure (Ret Nothing)
    _     -> do errorMsg ("funcao com retorno " ++ show ret ++ " precisa retornar valor")
                pure (Ret Nothing)

verComando g ret l (Ret (Just e)) = do
  (te, e') <- verExpr g l e
  case ret of
    TVoid -> do errorMsg "funcao void nao pode retornar valor"; pure (Ret (Just e'))
    _     -> do e'' <- coerceTo "retorno" ret te e'; pure (Ret (Just e''))

verComando g _ l (Proc f args) =
  case lookupFun f g of
    Nothing -> do errorMsg ("funcao '" ++ f ++ "' nao declarada"); pure (Proc f args)
    Just (formais, _) -> do args' <- verArgs g l f formais args; pure (Proc f args')

verBloco :: [Funcao] -> Tipo -> [Var] -> Bloco -> Result Bloco
verBloco g ret l = mapM (verComando g ret l)

verArgs :: [Funcao] -> [Var] -> Id -> [Var] -> [Expr] -> Result [Expr]
verArgs g l f formais args
  | length formais /= length args = do
      errorMsg ("funcao '" ++ f ++ "' chamada com " ++ show (length args)
                ++ " argumento(s), esperava " ++ show (length formais))
      mapM (\e -> do { (_, e') <- verExpr g l e; pure e' }) args   
  | otherwise = mapM coerceArg (zip formais args)
  where
    coerceArg (_ :#: (tf, _), e) = do
      (te, e') <- verExpr g l e
      coerceTo ("argumento de '" ++ f ++ "'") tf te e'   


duplicados :: [Id] -> [Id]
duplicados xs = nub (xs \\ nub xs)

checaDupFuncoes :: [Funcao] -> Result ()
checaDupFuncoes funs =
  mapM_ (\f -> errorMsg ("funcao '" ++ f ++ "' declarada multiplas vezes"))
        (duplicados [ f | (f :->: _) <- funs ])

checaDupVars :: String -> [Var] -> Result ()
checaDupVars ctx vars =
  mapM_ (\v -> errorMsg ("variavel '" ++ v ++ "' declarada multiplas vezes em " ++ ctx))
        (duplicados [ v | (v :#: _) <- vars ])

verCorpo :: [Funcao] -> (Id, [Var], Bloco) -> Result (Id, [Var], Bloco)
verCorpo g (fid, locais, bloco) = do
  let tret = case lookupFun fid g of      
               Just (_, t) -> t
               Nothing     -> TVoid
  checaDupVars ("funcao '" ++ fid ++ "'") locais   
  bloco' <- verBloco g tret locais bloco
  pure (fid, locais, bloco')

verPrograma :: Programa -> Result Programa
verPrograma (Prog funs corpos mainVars mainBloco) = do
  checaDupFuncoes funs
  corpos' <- mapM (verCorpo funs) corpos
  checaDupVars "bloco principal" mainVars
  mainBloco' <- verBloco funs TVoid mainVars mainBloco
  pure (Prog funs corpos' mainVars mainBloco')

 
