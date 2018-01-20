###Lambda Calc Review and Practice 

Below are some notes taken from lecture and slides. We wont be posting
the solutions to the practice problems we went through in discussion, 
but come to office hours if you have any questions. 

####Syntax
λx.e 
e ::=  <constant> 
	| <variable> 
	| (<expr> <expr>) 
	| (λ <variable>.<expr>) 

Variables, applications, lambda abstractions 

Is λx.λy.λz.e the same as λxyz.e? 
(x,y,z) => {}
(x) => (y) => (z) => {}

####Semantics
 
Function applications are left associative

e1 e2 e3 e4 
(((e1 e2) e3) e4)

Parenthesis have no meanings, you can add them as much as you want following the correct rules.
(Applications are left associative and terms are bound as far right as possible)

You can only drop parenthesis if the meaning isn't ambiguous.

####Substitution
(λx.(λy.(x + y))) 4 5 
Which arguments do we apply first? 

Free and bound variables 

Capture Avoiding Substitution 
y[x := e] = y
(e1 e2)[x := e] = e1[x := e] e2[x := e]
(λx.e1)[x := e] = λx.e1

Alpha renaming
λx.e = λy.e[x :=y], y != FV(e)

Beta Reduction 
(λx.e1)e2 = e1[x := e2]

Eta reduction
λx. e x = e , x != FV(e)


####Evaluation Order (CBV and CBN) 

Does matter which order you choose to simplify subexpressions IF it reduces to normal form?
What does normal form mean? Can no longer beta reduce 

(λx.e1) e2

(λx.y)Ω
 ----> y CBN 
 ----> (λx.y)Ω CBV

####Practice Problems 

1. const Y = f => (x => f(x(x)))(x =>f(x(x)))
   Y(z => 9)

2. (λx.x) (λy.x y z) - what are the free variables? 

Reductions
 
3. ((λx.(x y))(λz.z))

4. (λx.x)((λy.y) z)

5. (λf.λx.(f x)) λy.y+1

6. (λx.λy.x y)(λz.z)

7. ((λf.(λx.f (f x)))(λx.x+1)) 4

8. (λf.(λx.f(f x)))(λy.y+x)

9. (λx.y)((λx.x x)(λy.y z))

10. (λp.λq.λr.p q r)(λp.λq.p q r)

11. ((λf.((λg.((f f) g))(λh.(k h))))(λx.(λy.y)))


Evaluation Strategies - CBV & CBN

12. (λx.λy.y x)(5 + 2)(λx.x+1)

13. (λf.f 7)((λx.x x) λy.y) 
