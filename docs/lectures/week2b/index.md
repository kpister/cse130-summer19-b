### Lecture slides

* Type systems and type inference: [pdf](slides/types.pdf), [key](slides/types.key),

### Recommended reading

- Textbook: new [Chapter 6](readings/types.pdf) on types.
- [Type systems for programming languages](http://gallium.inria.fr/~remy/mpri/cours1.pdf) by Didier Rémy


### Type tetris

In our parametricity explorations we've explored some problems that not only
asked you to implement parametric functions, but do so in terms of other
parametric functions. This can be quite tricky, but also fun. Below is a worked
out example of the `hog` function from the homework using only the `(.)`
function:

```haskell
{!lectures/week4/code/type-tetris.hs!}
```
