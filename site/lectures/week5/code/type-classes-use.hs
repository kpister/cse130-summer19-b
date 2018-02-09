{-# LANGUAGE InstanceSigs #-}
module HasMap where

import Prelude hiding (map)

-- allEqual'  :: ???
allEqual' a b c = a == b && b == c 

-- Reall: map :: (a -> b) -> [a] -> [b]
-- Let's define this function to work on arbitrary things and not just lists,
-- say Maybe types and Tree types.

