### JavaScript fundamentals revisited by Purag Moumdjian

Below are the notes from the discussion section.

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
bound to a newly created object (whose prototype `__proto__` is `Car.prototype`),
allowing us to specify instance data attached to `this` inside a function
constructor.

Since functions create a new scope in JavaScript, and since JavaScript
functions are closures, we can create "hidden"/private fields and methods just
by declaring local variables and functions. These are only visible in the scope
of the function, and because functions are closures and capture the
environment, these "fields" and "methods" can be accessed even after the object
is created.

One caveat is that each instance of the object will have its own copy of every
private method, and if you want a public method that uses a private method, each
object needs a copy of that, too -- the public method will have to share the
scope of the private method.

This is not the way you want to manage private field, it's just an
illustration. See [this blog
post](https://curiosity-driven.org/private-properties-in-javascript) for a
discussion.

```javascript
{!discussions/week1/code/03.classes.js!}
```

#### Hoisting

JavaScript *hoists* `var` declaration and `function` declarations and
definitions to the top of the current scope. This behavior may or not be
desired, but if you want to avoid it, just use `let` and `const` to declare
variables, as they are not hoisted -- in other words, they create a new scope
only once they executed, and these scopes end as soon as the surrounding block
ends.

```javascript
{!discussions/week1/code/04.hoisting.js!}
```

#### Functions/Callbacks/Arrow Notation

Below, we have a function constructor for `Car`, and in the constructor we
create methods `getMake` and `getModel` which access the arguments of the
function. We return the new object to the caller and the function's scope ends,
but subsequent calls to `getMake` and `getModel` will still have access to the
arguments from the function's scope due to closure.

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

Below are some classical examples of closures.

```javascript
{!discussions/week1/code/closure.js!}
```
