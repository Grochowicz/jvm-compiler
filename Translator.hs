module Translator where
import Control.Monad.State
import AST

novoLabel::State Int String 
novoLabel = do
	n <- get
	put (n+1)
	return ("l"++show n)

genCab nome = return (".class public " ++ nome ++ 
                      "\n.super java/lang/Object\n\n.method public <init>()V\n\taload_0\n\tinvokenonvirtual java/lang/Object/<init>()V\n\treturn\n.end method\n\n")

genMainCab s l = return (".method public static main([Ljava/lang/String;)V" ++
                         "\n\t.limit stack " ++ show s ++
                         "\n\t.limit locals " ++ show l ++ "\n\n")


genExprL c tab fun v f (And e1 e2) = do
	l1 <- novoLabel
	e1' <- genExprL c tab fun l1 f e1
	e2' <- genExprL c tab fun v f e2
	return (e1' ++ l1++":\n" ++ e2')

genExprL c tab fun v f (Or e1 e2) = do
	l1 <- novoLabel
	e1' <- genExprL c tab fun v l1 e1
	e2' <- genExprL c tab fun v f e2
	return (e1' ++ l1++":\n" ++ e2')

genExprL c tab fun v f (Not e) = do
    e' <- genExprL c tab fun f v e
    return (e')

genExprL c tab fun v f (Rel r) = do
    r' <- genExprR c tab fun v f r
    return (r')

genExprR c tab fun v f (Req e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (e1' ++ e2' ++ "eq between " ++ show t1 ++ ", " ++ show t2 ++ "\n")
--	return (e1'++e2'++genRel t1 t2 v "eq"++"\tgoto "++f++"\n")
genExprR c tab fun v f (Rdif e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (e1' ++ e2' ++ "dif between " ++ show t1 ++ ", " ++ show t2 ++ "\n")
genExprR c tab fun v f (Rlt e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (e1' ++ e2' ++ "lt between " ++ show t1 ++ ", " ++ show t2 ++ "\n")
genExprR c tab fun v f (Rgt e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (e1' ++ e2' ++ "gt between " ++ show t1 ++ ", " ++ show t2 ++ "\n")
genExprR c tab fun v f (Rle e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (e1' ++ e2' ++ "le between " ++ show t1 ++ ", " ++ show t2 ++ "\n")
genExprR c tab fun v f (Rge e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (e1' ++ e2' ++ "ge between " ++ show t1 ++ ", " ++ show t2 ++ "\n")

--genExpr c tab fun (Const (CInt i)) = return (TInt, genInt i)
genExpr c tab fun (Const (CInt i)) = return (TInt, "push " ++ show i ++ "\n")
genExpr c tab fun (Const (CDouble d)) = return (TInt, "push " ++ show d ++ "\n")

genExpr c tab fun (Add e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (t1, e1' ++ e2' ++ "add " ++ show t1 ++ "\n")
--	return (t1, e1' ++ e2' ++ genOp t1 "add")
genExpr c tab fun (Sub e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (t1, e1' ++ e2' ++ "sub " ++ show t1 ++ "\n")
genExpr c tab fun (Mul e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (t1, e1' ++ e2' ++ "mul " ++ show t1 ++ "\n")
genExpr c tab fun (Div e1 e2) = do
	(t1, e1') <- genExpr c tab fun e1
	(t2, e2') <- genExpr c tab fun e2
	return (t1, e1' ++ e2' ++ "div " ++ show t1 ++ "\n")
genExpr c tab fun (Neg e) = do
	(t, e') <- genExpr c tab fun e
	return (t, e' ++ "neg " ++ show t ++ "\n")
genExpr c tab fun (IdVar x) = do
-- TODO ARRUMAR TIPOS. NÃO É SEMPRE INT
	return (TInt,"push var " ++ x ++ "\n")
genExpr c tab fun (Chamada f es) = do
	return (TInt,"call " ++ f ++ "\n")
genExpr c tab fun (Lit s) = do
	return (TString, "string " ++ s ++ "\n")
genExpr c tab fun (IntDouble e) = do
    (t,e') <- genExpr c tab fun e
    return (TDouble, e' ++ "i2d\n")
genExpr c tab fun (DoubleInt e) = do
    (t,e') <- genExpr c tab fun e
    return (TInt, e' ++ "d2i\n")

genCmd c tab fun (If e b1 b2) = do
    lv <- novoLabel
    lf <- novoLabel
    le <- novoLabel
    e' <- genExprL c tab fun lv lf e
    b1' <- genBloco c tab fun b1
    b2' <- genBloco c tab fun b2
    return (e'++lv++":\n"++b1'++"\tgoto le"++lf++":\n"++b2'++le++":\n")

genCmd c tab fun (While e b) = do
	li <- novoLabel
	lv <- novoLabel
	lf <- novoLabel
	e' <- genExprL c tab fun lv lf e
	b' <- genBloco c tab fun b
	return (li++":\n"++e'++lv++":\n"++b'++"\tgoto "++li++"\n"++lf++":\n")

genCmd c tab fun (Atrib id e) = do
    (t,e') <- genExpr c tab fun e
    return (e' ++ "var " ++ id ++ " store " ++ show t ++ "\n")

genCmd c tab fun (Leitura id) = do
    return ("read var " ++ id ++ "\n")

genCmd c tab fun (Imp e) = do
    (t,e') <- genExpr c tab fun e
    return (e' ++ "print " ++ show t ++ "\n")

genCmd c tab fun (Proc id args) = do
    return ("proc " ++ id ++ "\n")

genCmd c tab fun (Ret Nothing) = do
    return ("return\n")

genCmd c tab fun (Ret (Just e)) = do
    (t,e') <- genExpr c tab fun e
    return (e' ++ "return " ++ show t ++ "\n")

makeVarTable vars = "varTable"

genBloco :: String -> [Var] -> [Funcao] -> Bloco -> State Int String
genBloco c tab fun [] = return ""
genBloco c tab fun (x:xs) = do
    ra <- genCmd c tab fun x
    rb <- genBloco c tab fun xs
    return (ra ++ rb)

genProg nome (Prog funDecls funImpls mainVars mainBlock) = do
    c <- genCab nome
    b <- genBloco nome mainVars funDecls mainBlock
    return (c ++ " fun,impl,var " ++ b ++ "\treturn\n.end method\n")

gerar nome p = fst $ runState (genProg nome p) 0
