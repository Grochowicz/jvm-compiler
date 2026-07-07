module Gerador where

import AST
import Control.Monad.State

novoLabel :: State Int String
novoLabel = do {n <- get; put (n+1); return ("l" ++ show n)}


genCab nome = return (".class public " ++ nome ++
                      "\n.super java/lang/Object\n" ++
                      "\n.field public static _sc Ljava/util/Scanner;\n" ++
                      "\n.method public <init>()V\n\taload_0\n\tinvokenonvirtual java/lang/Object/<init>()V\n\treturn\n.end method\n\n" ++
                      ".method static <clinit>()V\n\t.limit stack 3\n" ++
                      "\tnew java/util/Scanner\n\tdup\n" ++
                      "\tgetstatic java/lang/System/in Ljava/io/InputStream;\n" ++
                      "\tinvokespecial java/util/Scanner/<init>(Ljava/io/InputStream;)V\n" ++
                      "\tputstatic " ++ nome ++ "/_sc Ljava/util/Scanner;\n" ++
                      "\treturn\n.end method\n\n")

genMainCab s l = return (".method public static main([Ljava/lang/String;)V" ++
                         "\n\t.limit stack " ++ show s ++
                         "\n\t.limit locals " ++ show l ++ "\n\n")

genFunCab c fun nome s l =
  let Just (params, tret) = lookupFun nome fun
  in return (".method public static " ++ nome ++ descritor params tret ++
             "\n\t.limit stack " ++ show s ++
             "\n\t.limit locals " ++ show l ++ "\n\n")




tamanho :: Tipo -> Integer
tamanho TDouble = 2     
tamanho _       = 1

enderecar :: Integer -> [Var] -> ([Var], Integer)
enderecar n []                    = ([], n)
enderecar n ((x :#: (t, _)) : vs) = let (vs', fim) = enderecar (n + tamanho t) vs
                                    in ((x :#: (t, n)) : vs', fim)

lookupVar :: Id -> [Var] -> (Tipo, Integer)
lookupVar x ((v :#: info) : vs) = if x == v then info else lookupVar x vs
lookupVar x [] = error ("variavel nao encontrada na geracao: " ++ x)

lookupFun :: Id -> [Funcao] -> Maybe ([Var], Tipo)
lookupFun _ [] = Nothing
lookupFun x ((g :->: sig) : gs) = if x == g then Just sig else lookupFun x gs

jtipo :: Tipo -> String
jtipo TInt    = "I"
jtipo TDouble = "D"
jtipo TString = "Ljava/lang/String;"
jtipo TVoid   = "V"

descritor :: [Var] -> Tipo -> String
descritor params tret = "(" ++ concat [jtipo t | (_ :#: (t, _)) <- params] ++ ")" ++ jtipo tret

-- ---------------------------------------------------------------------
-- Instrucoes auxiliares
-- ---------------------------------------------------------------------

genInt :: Integer -> String
genInt i
  | i >= 0 && i <= 5                 = "\ticonst_" ++ show i ++ "\n"
  | i == (-1)                        = "\ticonst_m1\n"
  | i >= (-128)   && i <= 127        = "\tbipush " ++ show i ++ "\n"
  | i >= (-32768) && i <= 32767      = "\tsipush " ++ show i ++ "\n"
  | otherwise                        = "\tldc " ++ show i ++ "\n"

genDouble :: Double -> String
genDouble d
  | d == 0.0  = "\tdconst_0\n"
  | d == 1.0  = "\tdconst_1\n"
  | otherwise = "\tldc2_w " ++ show d ++ "\n"

prefixo :: Tipo -> String
prefixo TInt    = "i"
prefixo TDouble = "d"
prefixo TString = "a"
prefixo TVoid   = ""

genOp :: Tipo -> String -> String
genOp t op = "\t" ++ prefixo t ++ op ++ "\n"

genLoad :: Tipo -> Integer -> String
genLoad t n = "\t" ++ prefixo t ++ "load " ++ show n ++ "\n"

genStore :: Tipo -> Integer -> String
genStore t n = "\t" ++ prefixo t ++ "store " ++ show n ++ "\n"

-- comparacao: salta para v se a relacao (op) for verdadeira
genRel :: Tipo -> Tipo -> String -> String -> String
genRel TInt    TInt    v op = "\tif_icmp" ++ op ++ " " ++ v ++ "\n"
genRel TDouble TDouble v op = "\tdcmpg\n\tif" ++ op ++ " " ++ v ++ "\n"
genRel TString TString v op = "\tinvokevirtual java/lang/String/compareTo(Ljava/lang/String;)I\n" ++
                              "\tif" ++ op ++ " " ++ v ++ "\n"
genRel _ _ v op = "\tif_icmp" ++ op ++ " " ++ v ++ "\n"   


genExpr :: String -> [Var] -> [Funcao] -> Expr -> State Int (Tipo, String)
genExpr c tab fun (Const (CInt i))    = return (TInt,    genInt i)
genExpr c tab fun (Const (CDouble d)) = return (TDouble, genDouble d)
genExpr c tab fun (Lit s)             = return (TString, "\tldc \"" ++ s ++ "\"\n")

genExpr c tab fun (IdVar x) = let (t, n) = lookupVar x tab
                              in return (t, genLoad t n)

genExpr c tab fun (Add e1 e2) = genBin c tab fun e1 e2 "add"
genExpr c tab fun (Sub e1 e2) = genBin c tab fun e1 e2 "sub"
genExpr c tab fun (Mul e1 e2) = genBin c tab fun e1 e2 "mul"
genExpr c tab fun (Div e1 e2) = genBin c tab fun e1 e2 "div"

genExpr c tab fun (Neg e) = do {(t, e') <- genExpr c tab fun e; return (t, e' ++ genOp t "neg")}

genExpr c tab fun (IntDouble e) = do {(_, e') <- genExpr c tab fun e; return (TDouble, e' ++ "\ti2d\n")}
genExpr c tab fun (DoubleInt e) = do {(_, e') <- genExpr c tab fun e; return (TInt,    e' ++ "\td2i\n")}

genExpr c tab fun (Chamada g args) = do
  let Just (params, tret) = lookupFun g fun
  args' <- mapM (genExpr c tab fun) args
  return (tret, concatMap snd args' ++
                "\tinvokestatic " ++ c ++ "/" ++ g ++ descritor params tret ++ "\n")

genBin c tab fun e1 e2 op = do
  (t1, e1') <- genExpr c tab fun e1
  (t2, e2') <- genExpr c tab fun e2
  return (t1, e1' ++ e2' ++ genOp t1 op)    


genExprR :: String -> [Var] -> [Funcao] -> String -> String -> ExprR -> State Int String
genExprR c tab fun v f (Req  e1 e2) = genRelExpr c tab fun v f e1 e2 "eq"
genExprR c tab fun v f (Rdif e1 e2) = genRelExpr c tab fun v f e1 e2 "ne"
genExprR c tab fun v f (Rlt  e1 e2) = genRelExpr c tab fun v f e1 e2 "lt"
genExprR c tab fun v f (Rgt  e1 e2) = genRelExpr c tab fun v f e1 e2 "gt"
genExprR c tab fun v f (Rle  e1 e2) = genRelExpr c tab fun v f e1 e2 "le"
genExprR c tab fun v f (Rge  e1 e2) = genRelExpr c tab fun v f e1 e2 "ge"

genRelExpr c tab fun v f e1 e2 op = do
  (t1, e1') <- genExpr c tab fun e1
  (t2, e2') <- genExpr c tab fun e2
  return (e1' ++ e2' ++ genRel t1 t2 v op ++ "\tgoto " ++ f ++ "\n")



genExprL :: String -> [Var] -> [Funcao] -> String -> String -> ExprL -> State Int String
genExprL c tab fun v f (And e1 e2) = do
  l1  <- novoLabel
  e1' <- genExprL c tab fun l1 f e1     
  e2' <- genExprL c tab fun v  f e2
  return (e1' ++ l1 ++ ":\n" ++ e2')

genExprL c tab fun v f (Or e1 e2) = do
  l1  <- novoLabel
  e1' <- genExprL c tab fun v l1 e1 
  e2' <- genExprL c tab fun v f  e2
  return (e1' ++ l1 ++ ":\n" ++ e2')

genExprL c tab fun v f (Not e) = genExprL c tab fun f v e   

genExprL c tab fun v f (Rel r) = genExprR c tab fun v f r



genCmd :: String -> [Var] -> [Funcao] -> Comando -> State Int String

genCmd c tab fun (Atrib x e) = do
  (te, e') <- genExpr c tab fun e
  let (tv, n) = lookupVar x tab
  return (e' ++ genStore tv n)

genCmd c tab fun (Imp e) = do
  (t, e') <- genExpr c tab fun e
  return ("\tgetstatic java/lang/System/out Ljava/io/PrintStream;\n" ++ e' ++
          "\tinvokevirtual java/io/PrintStream/println(" ++ jtipo t ++ ")V\n")

genCmd c tab fun (Leitura x) =
  let (t, n)  = lookupVar x tab
      metodo  = case t of
                  TInt    -> "nextInt()I"
                  TDouble -> "nextDouble()D"
                  TString -> "next()Ljava/lang/String;"
                  TVoid   -> error "leitura em void"
  in return ("\tgetstatic " ++ c ++ "/_sc Ljava/util/Scanner;\n" ++
             "\tinvokevirtual java/util/Scanner/" ++ metodo ++ "\n" ++
             genStore t n)

genCmd c tab fun (If e b1 b2) = do
  lv   <- novoLabel
  lf   <- novoLabel
  lfim <- novoLabel
  e'   <- genExprL c tab fun lv lf e
  b1'  <- genBloco c tab fun b1
  b2'  <- genBloco c tab fun b2
  return (e' ++ lv ++ ":\n" ++ b1' ++ "\tgoto " ++ lfim ++ "\n" ++
          lf ++ ":\n" ++ b2' ++ lfim ++ ":\n")

genCmd c tab fun (While e b) = do
  li <- novoLabel
  lv <- novoLabel
  lf <- novoLabel
  e' <- genExprL c tab fun lv lf e
  b' <- genBloco c tab fun b
  return (li ++ ":\n" ++ e' ++ lv ++ ":\n" ++ b' ++
          "\tgoto " ++ li ++ "\n" ++ lf ++ ":\n")

genCmd c tab fun (Ret Nothing)  = return "\treturn\n"
genCmd c tab fun (Ret (Just e)) = do
  (t, e') <- genExpr c tab fun e
  return (e' ++ genOp t "return")

genCmd c tab fun (Proc g args) = do
  (tret, code) <- genExpr c tab fun (Chamada g args)
  let descarta = case tret of
                   TVoid   -> ""
                   TDouble -> "\tpop2\n"
                   _       -> "\tpop\n"
  return (code ++ descarta)

genBloco :: String -> [Var] -> [Funcao] -> Bloco -> State Int String
genBloco c tab fun b = do {cs <- mapM (genCmd c tab fun) b; return (concat cs)}




retornoFinal :: Tipo -> String
retornoFinal TVoid   = "\treturn\n"
retornoFinal TInt    = "\ticonst_0\n\tireturn\n"
retornoFinal TDouble = "\tdconst_0\n\tdreturn\n"
retornoFinal TString = "\tldc \"\"\n\tareturn\n"

genFuncao :: String -> [Funcao] -> (Id, [Var], Bloco) -> State Int String
genFuncao c fun (nome, vars, bloco) = do
  let (tab, nlocais) = enderecar 0 vars       
  let Just (_, tret) = lookupFun nome fun
  cab   <- genFunCab c fun nome 20 nlocais
  corpo <- genBloco c tab fun bloco
  return (cab ++ corpo ++ retornoFinal tret ++ ".end method\n\n")

genMain :: String -> [Funcao] -> [Var] -> Bloco -> State Int String
genMain c fun vars bloco = do
  let (tab, nlocais) = enderecar 1 vars     
  cab   <- genMainCab 20 nlocais
  corpo <- genBloco c tab fun bloco
  return (cab ++ corpo ++ "\treturn\n.end method\n")

genProg :: String -> Programa -> State Int String
genProg nome (Prog fun corpos mainVars mainBloco) = do
  cab     <- genCab nome
  funcoes <- mapM (genFuncao nome fun) corpos
  main'   <- genMain nome fun mainVars mainBloco
  return (cab ++ concat funcoes ++ main')

gerar :: String -> Programa -> String
gerar nome p = fst $ runState (genProg nome p) 0
