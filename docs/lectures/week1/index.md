### Lecture slides and code

* Introduction: [pdf](slides/intro.pdf), [key](slides/intro.key)
* JavaScript in a Nutshell: [pdf](slides/js-nutshell.pdf), [key](slides/js-nutshell.key)

### Recommended reading

If you have not worked with JavaScript before, take some time to familiarize
yourself with the basics of the language, as most of the labs in this class
will be in JavaScript.

We recommend the [Mozilla Developer Network's JavaScript
Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide), but
there are many other tutorials on the Internet.

Dave Herman's [Effective JavaScript](http://effectivejs.com/) is very good
reference that covers a lot of the JavaScript intricacies.  You will not need
this for the class, but if you end up writing JavaScript code in the outside
world, this book is must-read.

### Additional resources/reading for the curious

- [Block
  bindings](https://leanpub.com/understandinges6/read#leanpub-auto-block-bindings)
  and the difference between `var`, `let`, and `const`.
- Why a language like JavaScript took over the world? Not that uncommon, see
  [The Rise of "Worse is
  Better"](https://www.jwz.org/doc/worse-is-better.html).
- [Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures)
  explained; see, especially the creating closures in a loop section.
- [Private properties in (modern) JavaScript](https://curiosity-driven.org/private-properties-in-javascript); we will revisit the idea of private properties (encapsulation) later in the course.
- [Short intro to memory management for
  JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_Management).
- [ES6 In Depth](https://hacks.mozilla.org/category/es6-in-depth/) contains
  more information on the more recent features introduced to JavaScript.
- [Arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).
- [JavaScript No-No's](js_nono.md).

### Source code used in class

Below you'll find the source files we used during lecture. You can run these
with [Node.js](https://nodejs.org/en/).


#### Scoping

Block scoping in modern JS:
```javascript
{!lectures/week1/code/scoping/scope-modern.js!}
```

Function (but not block) scoping for `var`s:
```javascript
{!lectures/week1/code/scoping/scope-var.js!}
```

Mimicking block scoping with functions:
```javascript
{!lectures/week1/code/scoping/scope-modernize-var.js!}
```

Now, with arrow functions:
```javascript
{!lectures/week1/code/scoping/scope-modernize-var-pretty.js!}
```

#### Performance

Without high-order functions, we'd perform reads and write synchronously:
```javascript
{!lectures/week1/code/performance/perf-sync.js!}
```

Passing (callback) functions as arguments allows the runtime system to call our function whenever it's ready. This allows it to perform IO concurrently and more efficiently:
```javascript
{!lectures/week1/code/performance/perf-async.js!}
```

Once we can return functions we can also express our code more compactly too:
```javascript
{!lectures/week1/code/performance/perf-async-2.js!}
```

And, slightly cleaner:
```javascript
{!lectures/week1/code/performance/perf-async-3.js!}
```

#### Expressiveness

High-order functions enables expressiveness:
```javascript
{!lectures/week1/code/expressive/expressive.js!}
```

It also can enable more efficient code:
```javascript
{!lectures/week1/code/expressive/hof.js!}
```

#### Abstraction

We can also use functions to implement module systems.

Consider a simple module in Node.js:
```javascript
{!lectures/week1/code/modules/module-node.js!}
```

This module can be loaded with `require`, which is (very) roughly implemented
as follows:
```javascript
{!lectures/week1/code/modules/module.js!}
```

#### Objects

We'll be looking at objects later in the class. Objects can be expressed
ad-hoc, using object literal notation:
```javascript
{!lectures/week1/code/receiver/receiver.js!}
```

But we can (again) use functions to construct objects:
```javascript
{!lectures/week1/code/class/class-old.js!}
```

More recently, however, JavaScript adopted classes. You can think of them as
being *syntactic sugar* for the above:

```javascript
{!lectures/week1/code/class/class-new.js!}
```
