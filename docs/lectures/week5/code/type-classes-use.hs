data Tree a = Node (Tree a) (Tree a)
            | Leaf a

instance Show a => Show (Tree a) where
  show (Leaf a)   = "Leaf " ++ show a
  show (Node l r) = "Node " ++ show l ++ "@" ++ show r
