module TypeClasses1 where
import qualified Prelude
import Prelude hiding (Num(..), Eq(..), Ord(..), map)

-- # Eq class with dictionaries

data Eq a = MkEqDict { 
  (==) :: a -> a -> Bool,
  (/=) :: a -> a -> Bool
  }

-- instance Eq Bool where ...
dEqBool :: Eq Bool
dEqBool = MkEqDict eq nEq
    where eq True True   = True
          eq False False = True
          eq _ _         = False
          nEq x y        =  not $ eq x y

-- allEqual :: Eq a => a -> a -> a -> Bool with dictionaries:
allEqual :: Eq a -> a -> a -> a -> Bool
allEqual dict a b c = (==) dict a b && (==) dict b c

-- instance Eq a => Eq [a] where ...
dEqList :: Eq a -> Eq [a]
dEqList elDict = MkEqDict eq nEq
    where eq [] []         = True
          eq (x:xs) (y:ys) = (==) elDict x y && eq xs ys
          eq _ _           = False
          nEq x y          =  not $ eq x y

-- instance (Eq a, Eq b) => Eq (a, b) where ...
dEqPair :: Eq a -> Eq b -> Eq (a, b)
dEqPair aDict bDict = MkEqDict eq nEq
    where eq (x1,y1) (x2,y2) = (==) aDict x1 x2 && (==) bDict y1 y2
          nEq x y            =  not $ eq x y

-- # Ord class

data Ord a = MkOrd { (<=) :: a -> a -> Bool,
                      eqD :: Eq a }


compare :: Ord a -> a -> a -> Ordering
compare d x y = undefined

-- # Num class

-- Our "primitives"
plusInt :: Int -> Int -> Int
plusInt = (Prelude.+)
mulInt :: Int -> Int -> Int
mulInt  = (Prelude.*)
negInt :: Int -> Int
negInt = Prelude.negate
integerToInt :: Integer -> Int
integerToInt = Prelude.fromInteger

-- Dictionary
data Num a = MkNumDict {
                (+) :: a -> a -> a,
                (*) :: a -> a -> a,
                negate :: a -> a
             }

-- square :: Num a => a -> a
square :: Num a -> a -> a
square = undefined

dNumInt :: Num Int
dNumInt = MkNumDict plusInt mulInt negInt

-- squares :: (Num a, Num b) => a -> b -> (a, b)
squares :: Num a -> Num b -> a -> b -> (a,b)
squares dx dy x y = undefined

