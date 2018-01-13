// Closure example

// #1
{
  var funcs = [];
  for (var i = 0; i < 10; i++) {
    funcs.push(function () {
      console.log(i);
    });
  }
  funcs.forEach(function (func) {
    func();
  });
}

// #2
{
  let i = 5;

  const f = () => console.log(i);

  f(); // ??

  i = 10;

  f(); // ??
}

// #3
// How do we fix the problem in #1?
{
  let funcs = [];
  for (let i = 0; i < 10; i++) {
    funcs.push(() => console.log(i));
  }
  funcs.forEach((func) => func());
}

// #4
// How can we fix it without using let? (Also, how did we fix this before let?)
{
  var funcs = [];
  for (var i = 0; i < 10; i++) {
    funcs.push((function (j) {
      return function () {
        console.log(j);
      }
    })(i));
  }
  funcs.forEach(function (func) {
    func();
  });

  // or...
  funcs = [];
  for (var i = 0; i < 10; i++) {
    funcs.push(function (j) {
      console.log(j);
    }.bind(null, i));
  }
  funcs.forEach(function (func) {
    func();
  });
}
