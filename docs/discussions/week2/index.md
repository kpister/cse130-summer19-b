###Lambda Calc Review and Practice by Nadah Feteih

Below are some notes taken from lecture and slides. We wont be posting
the solutions to the practice problems we went through in discussion, 
but come to office hours if you have any questions. 

####Syntax

```
e ::= x | (e e) | (λx.e)
```

Variables, applications, lambda abstractions 

Faking multi-argument functions.  Is `λx.λy.λz.e` the same as `λxyz.e`? No, why not. See:

```javascript
(x,y,z) => {} /* same as: */
(x) => (y) => (z) => {} /* ? */
```

####Syntax
 
Function applications are left associative

```
e1 e2 e3 e4 = (((e1 e2) e3) e4)
```

Parenthesis have no meanings, you can add them as much as you want following the correct rules.
(Applications are left associative and terms are bound as far right as possible)

You can only drop parenthesis if the meaning isn't ambiguous.

####Semantics

- `(λx.(λy.(x + y))) 4 5` which arguments do we apply first? 

- Free and bound variables 

- Capture avoiding substitution 

```
...
y[x := e] = y
(e1 e2)[x := e] = e1[x := e] e2[x := e]
(λx.e1)[x := e] = λx.e1
...
```

- Alpha renaming

```
λx.e = λy.e[x :=y], y != FV(e)
```

- Beta reduction 

```
(λx.e1)e2 = e1[x := e2]
```

- Eta reduction

```
λx. e x = e , x != FV(e)
```


####Evaluation Order (CBV and CBN) 

- Does it matter which order you choose to simplify subexpressions IF it reduces to normal form?

- What does normal form mean? Can no longer beta reduce.

- Some terms cannot be reduced to normal form. For example,

```
(λx.y)Ω
 ----> y CBN 
 ----> (λx.y)Ω CBV
```

####Practice Problems 

-  What doe the following produce?

```javascript
const Y = f => (x => f(x(x)))(x =>f(x(x)))
Y(z => 9)
```

-  `(λx.x) (λy.x y z)` - what are the free variables? 

Reduce the following
 
-  `((λx.(x y))(λz.z))`

-  `(λx.x)((λy.y) z)`

-  `(λf.λx.(f x)) λy.y+1`

-  `(λx.λy.x y)(λz.z)`

-  `((λf.(λx.f (f x)))(λx.x+1)) 4`

-  `(λf.(λx.f(f x)))(λy.y+x)`

-  `(λx.y)((λx.x x)(λy.y z))`

-  `(λp.λq.λr.p q r)(λp.λq.p q r)`

-  ((λf.((λg.((f f) g))(λh.(k h))))(λx.(λy.y)))`

Evaluation Strategies - Reduce with CBV & CBN

-  `(λx.λy.y x)(5 + 2)(λx.x+1)`

-  `(λf.f 7)((λx.x x) λy.y) `
