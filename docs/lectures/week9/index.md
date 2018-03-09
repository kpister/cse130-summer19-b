### Lecture slides

* Monads, continued from [Week 8](../week8). The videos go into the desugarion
  of IO action into Worlds -- watch them!
* Intro to constant-time: [pdf](slides/constant-time.pdf), [key](slides/constant-time.key),

### Recommended reading

* Monad sources from [Week 8](../week8).
* [Why Constant-Time Crypto](https://www.bearssl.org/constanttime.html) by Thomas Pornin
* [Remote Timing Attacks are Practical](https://crypto.stanford.edu/~dabo/pubs/papers/ssl-timing.pdf) by David Brumley and Dan Boneh

### Code snippets

#### Implementing wc in Haskell

```haskell
{!lectures/week9/code/wc.hs!}
```

#### Functor-like type class

```haskell
{!lectures/week9/code/hasmap.hs!}
```
