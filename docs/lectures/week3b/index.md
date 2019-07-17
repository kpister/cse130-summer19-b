### Lecture slides

* Type classes and type inference: [pdf](slides/type-classes.pdf), [key](slides/type-classes.key),

### Recommended reading

- Textbook: new [Chapter 7](readings/type-classes.pdf) on type classes.

### Code snippets

Below are the code snippets from class.

#### Show

```haskell
{!lectures/week3b/code/type-classes-show.hs!}
```

#### Eq

```haskell
{!lectures/week3b/code/type-classes-eq.hs!}
```

#### Num

```haskell
{!lectures/week3b/code/type-classes-num.hs!}
```

#### Desugaring type classes to dictionaries

Original code, using type classes:

```haskell
{!lectures/week3b/code/type-classes-sugar.hs!}
```

Desugaring it to dictionaries:
```haskell
{!lectures/week3b/code/type-classes-desugar.hs!}
```

#### A more complex example with type constructors

```haskell
{!lectures/week3b/code/type-classes-complex.hs!}
```

