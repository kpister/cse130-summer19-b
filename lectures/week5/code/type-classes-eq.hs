
-- Recall our tiny calculator language
data Expr = AddExpr Expr Expr
          | MulExpr Expr Expr
          | ConstExpr Int
          deriving Eq
  


eval :: Expr -> Int
eval (ConstExpr n) = n
eval (AddExpr e1 e2) = eval e1 + eval e2
eval (MulExpr e1 e2) = eval e1 * eval e2

instance Show Expr where
  show (ConstExpr i) = show i
  show (AddExpr e1 e2) = unwords ["(", show e1, ")", "+", "(", show e2, ")"]
  show (MulExpr e1 e2) = unwords ["(", show e1, ")", "*", "(", show e2, ")"]

  
ex0 :: Expr
ex0 = (AddExpr (ConstExpr 2) (MulExpr (ConstExpr 1) (ConstExpr 1)))

ex1 :: Expr
ex1 = (AddExpr (ConstExpr 1) (MulExpr (ConstExpr 1) (ConstExpr 2)))

eq = ex0 == ex1 -- A: yes, B: no?
--
-- instance Eq Expr where
--   exp1 == exp2 = eval exp1 == eval exp2
