module TypeClasses1 where
import qualified Prelude
import Prelude hiding (Num(..), Eq(..), Ord(..), map)

-- # Eq class examples
class Eq a where
 (==) :: a -> a -> Bool
 (/=) :: a -> a -> Bool
 (/=) x y = not $ x == y

instance Eq Bool where
  True  == True  = True
  False == False = True
  _     == _     = False

allEqual :: Eq a => a -> a -> a -> Bool
allEqual a b c = (==) a b && (==) b c 

instance Eq a => Eq [a] where
  (==) []     []     = True
  (==) (x:xs) (y:ys) = (==) x y && (==) xs ys
  (==) _      _      = False

instance (Eq a, Eq b) => Eq (a, b) where
  (==) (x1,y1) (x2,y2) = (==) x1 x2 && (==) y1 y2

-- # Ord class

class Eq a => Ord a where
  (<)  :: a -> a -> Bool
  (<) x y = (<=) x y && (/=) x y
  (<=) :: a -> a -> Bool
  (<=) x y = (<) x y || (==) x y


compare :: Ord a => a -> a -> Ordering
compare x y = if x == y then EQ
                  else if x <= y
                          then LT
                          else GT

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
class Num a where
   (+) :: a -> a -> a
   (*) :: a -> a -> a
   negate :: a -> a

square :: Num a => a -> a
square x = x * x

instance Num Int where
 (+) = plusInt
 (*) = mulInt
 negate = negInt

squares :: (Num a, Num b) => a -> b -> (a,b)
squares x y = (x*x, y*y)
