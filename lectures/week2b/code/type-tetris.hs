--------------------------------------------------------------
-- Simplified example:
--------------------------------------------------------------
foo0 :: (b -> c) -> (a -> b) -> a -> c
foo0 f g x = f (g x)
-- Can be rewritten with the function composition operator (.) as:
foo1 :: (b -> c) -> (a -> b) -> a -> c
foo1 f g x = (f . g) x
-- We can get rid of the x (eta conversion):
foo2 :: (b -> c) -> (a -> b) -> a -> c
foo2 f g = f . g
-- Let's rewrite it in prefix form now:
foo3 :: (b -> c) -> (a -> b) -> a -> c
foo3 f g = (.) f g
-- Get rid of g (eta again):
foo4 :: (b -> c) -> (a -> b) -> a -> c
foo4 f = (.) f
-- Get rid of f (eta again):
foo5 :: (b -> c) -> (a -> b) -> a -> c
foo5 = (.)

--------------------------------------------------------------
--------------------------------------------------------------

hog :: (c -> d) -> (a -> b -> c) -> a -> b -> d
hog = undefined

-- Let's write this with explicit arguments
hog0 :: (c -> d) -> (a -> b -> c) -> a -> b -> d
hog0 fCD fABC vA vB = undefined

-- Note that we want to produce a d at the end of the day
-- What gives us a d? fCD when called with a c
-- How do we get a c? Well fABC gives us c when called with an a and b
hog1 :: (c -> d) -> (a -> b -> c) -> a -> b -> d
hog1 fCD fABC vA vB = fCD (fABC vA vB)

-- Another way to look at the type is to write all the parantheses: How can you
-- think of this? fABC is almost the thing you want to return. You only need to
-- change that c into a d. And the fCD function can be used to do exacly that!

hog2 :: (c -> d) -> (a -> (b -> c)) -> (a -> (b -> d))
hog2 fCD fABC vA =
  (.) fCD  {- :: (c -> d) -}
      (fABC vA {- :: (b -> c) -})

-- We can now get rid of the vA:
hog3 :: (c -> d) -> (a -> (b -> c)) -> (a -> (b -> d))
hog3 fCD fABC = ((.) fCD) . fABC

-- To get rid of fABC, let's first rewrite it in prefix:
hog4 :: (c -> d) -> (a -> (b -> c)) -> (a -> (b -> d))
hog4 fCD fABC = (.) ((.) fCD) fABC

-- Now you can just get rid of fABC (eta conversion):
hog5 :: (c -> d) -> (a -> (b -> c)) -> (a -> (b -> d))
hog5 fCD = (.) ((.) fCD)

-- We can now rewrite hog5 by moving fCD to the outside (look at foo1, the (.)
-- are just functions like f and g):
hog6 :: (c -> d) -> (a -> (b -> c)) -> (a -> (b -> d))
hog6 fCD = ((.) . (.)) fCD

-- Finally we can just get rid of fCD (eta) and redundant parantheses:
hog7 :: (c -> d) -> (a -> (b -> c)) -> (a -> (b -> d))
hog7 = (.) . (.)
