module Intro where

-- * One type can have multiple constructors
data Point = Cartesian Double Double
           | Polar Double Double
           deriving Show

-- E.g., convert point to cartesian:
toCartesian :: Point -> Point
toCartesian point = case point of
                      Polar r theta -> Cartesian (r * cos theta)
                                                 (r * sin theta)
                      pt@(Cartesian _ _) -> pt

-- instance Num Point where
