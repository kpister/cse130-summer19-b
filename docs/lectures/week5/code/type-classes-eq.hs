
-- Recall our tiny calculator language
data Expr = AddExpr Expr Expr
          | MulExpr Expr Expr
          | ConstExpr Int
          deriving (Eq)

eval :: Expr -> Int
eval (ConstExpr n) = n
eval (AddExpr e1 e2) = eval e1 + eval e2
eval (MulExpr e1 e2) = eval e1 * eval e2

instance Show Expr where
  show (AddExpr e1 e2) = unwords ["(", show e1, ")", "+", "(", show e2, ")"]
  show (MulExpr e1 e2) = unwords ["(", show e1, ")", "*", "(", show e2, ")"]
  show (ConstExpr i)   = show i
  
ex0 :: Expr
ex0 = (AddExpr (ConstExpr 3) (MulExpr (ConstExpr 5) (ConstExpr 4)))

ex1 :: Expr
ex1 = (AddExpr (ConstExpr 3) (MulExpr (ConstExpr 4) (ConstExpr 5)))

eq = ex0 == ex1 -- A: yes, B: no?

-- TODO: define syntactic and semantic equivalence
-- instance Eq Expr where
