function f(x) {
  let y = x; // note that x is captured here
  return function (z) {
    y += z;
    return y;
  };
}

const h = f(5);
console.log(h(3)); // ??
console.log(h(4)); // ??
const j = f(5);
console.log(j(3)); // ?
console.log(j(4)); // ??

console.log(h === j); // ??
