### JavaScript fundamentals revisited

#### The `global` object

In Node.js, the `global` object contains functions (and lots of other
information) exposed by the runtime environment.

By default, `this` in the top-level scope of a node module refers to the module
itself. When not in strict mode, `this` inside a function is automatically
assigned the `global` object.

```javascript
{!discussions/week1/code/01.globalobj.js!}
```

#### Receivers/the `this` keyword

We can dynamically change the value of `this` when executing a function which
uses it. All functions in JavaScript have three methods which let us do this:
`call`, `apply`, and `bind`.

`call` and `apply` immediately invoke the function with the specified receiver
(target object) and arguments. `bind` creates a new function with the receiver
(and any provided arguments) *bound* to the specified values. This lets us
create clones of functions where the `this` keyword always refers to a specific
object (see `swapObj2` below).

`bind` also lets us accomplish *partial application* of functions, meaning we
can create copies of functions with some (or all) of the arguments already
fixed. We'll revisit this in detail throughout the quarter.

```javascript
{!discussions/week1/code/02.this.js!}
```

#### Classes/Function constructors

Before classes were native to JavaScript, we would use plain old functions to
construct objects. These are called *function constructors*. When we invoke any
function with the `new` keyword (i.e. `new Car()`), `this` is automatically
bound to a newly created object with `Car`'s prototype, allowing us to specify
instance data attached to `this` inside a function constructor.

Since functions create a new scope in JavaScript, and since JavaScript supports
closures, we can create "hidden"/private fields and methods just by declaring
local variables and functions. These are only visible in the scope of the
function, and due to closures, can be accessed even after the object is created
and we return from the function constructor.

One caveat is that each instance of the object will have its own copy of every
private method, and if you want a public method that uses a private method, each
object needs a copy of that, too, since the public method will have to share the
scope of the private method.

```javascript
{!discussions/week1/code/03.classes.js!}
```

#### Hoisting

JavaScript "hoists" `var` and `function` declarations to the top of the current
scope. This behavior may or not be desired, but if you want to avoid it, just
use `let` and `const` to declare variables, as they are not hoisted -- in other
words, they create a new scope only once they executed, and these scopes end
as soon as the surrounding block ends.

```javascript
{!discussions/week1/code/04.hoisting.js!}
```

#### Functions/Callbacks/Arrow Notation

In JavaScript, functions are objects, so we can call methods and access fields
on functions themselves. JavaScript also supports closures, which is just the
idea of a scope persisting after it ends.

Below, we have a function constructor
for `Car`, and in the constructor we create methods `getMake` and `getModel`
which access the arguments of the function. We return the new object to the
caller and the function's scope ends, but subsequent calls to `getMake` and
`getModel` will still have access to the arguments from the function's scope
due to closure.

For another example, see [Closure](#closure)

```javascript
{!discussions/week1/code/05.functions.js!}
```

#### List Manipulation a la Functional Programming in JavaScript

`map`, `reduce` (or `fold`), and `filter` are three examples of list
manipulation functions. Recursion is the bread and butter of functional
programming, and these functions are prime examples. JavaScript arrays natively
support some of these behaviors, as seen below.

```javascript
{!discussions/week1/code/06.functional.js!}
```

#### Closure

Like we said before, a closure is just a persistent scope. When you call or
create a function whose return value is (or contains) a function which accesses
an outer scope, a closure is created, storing the values of the variables in
scope.

Here is a classic example where closure helps us achieve our desired behavior.
Say we want to create a list of functions which output the numbers 0-9. A first
approach is seen below, with #1. What happens when we execute all of the
functions?

As you may have noticed, all of the functions print `10`. We can see why by
looking at #2. Say we have a function which prints the value of a variable `i`,
and between calls we change the value of that variable. It's completely
reasonable for subsequent calls to print a different value.

This is all that's happening here. When we actually call the functions in #1,
they dynamically look up the value of `i`, but it has been incremented up to
`10`.

A very simple way to fix this is by using `let` instead of `var` to declare the
loop variable. With `let`, each iteration gets its own declaration of `i` whose
value is fixed. Then, when we create the function and put it in the array, we
create a closure, storing the value of `i` for that block.

Another way to fix this: we can use an immediately-invoked function expression
(IIFE) to create a closure which contains a fixed value of `i` in each
iteration. Then, when we call the functions after the loop, each one looks for
the value of `i` in its closure, where its value is fixed to the value of `i` in
the iteration we created it in.

Another way to get the behavior we want is using `bind`. This time, we print the
argument to our function, and use `bind` to fix the value of that argument to
the value of `i` in the iteration we created the function in.

```javascript
{!discussions/week1/code/closure.js!}
```
