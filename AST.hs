module AST where

type Id = String

data Var = Id :#: Double deriving Show

data Expr = Let Id Expr Expr | Add Expr Expr | Sub Expr Expr | Mul Expr Expr | Div Expr Expr | Const Double | Var Id 
                deriving (Show, Eq)

