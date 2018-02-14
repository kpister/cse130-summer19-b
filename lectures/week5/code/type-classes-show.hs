data Tree a = Node (Tree a) (Tree a)
            | Leaf a

instance Show a => Show (Tree a) where
 show (Leaf a) = show a
 show (Node lt rt) = show lt ++ " /\\ " ++ show rt

data Color = Red | Green | Blue | Indigo | Violet
           deriving Show
