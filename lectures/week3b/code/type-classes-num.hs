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

instance Num Point where
  (Cartesian x1 y1) + (Cartesian x2 y2) = Cartesian (x1+x2) (y1+y2)
  p1@(Polar _ _) + p2@(Polar _ _) = toCartesian p1 + toCartesian p2

  (Cartesian x1 y1) * (Cartesian x2 y2) = Cartesian (x1*x2) (y1*y2)
  p1 * p2 = toCartesian p1 * toCartesian p2
