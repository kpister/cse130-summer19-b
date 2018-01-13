// functions + closures

function f () {
  return 0;
}

console.log(typeof f); // ??
console.log(f instanceof Object); // ??

console.log(f.toString()); // ??

// Back to function constructors
let Car = function (make, model) {
  this.getMake = function () {
    return make;
  };

  this.getModel = function () {
    return model;
  };
}

let car1 = new Car("toyota", "camry");

console.log(car1.getMake(), car1.getModel()); // ??

// Arrow notation: more concise, especially with callbacks
const g = () => {
  return 0;
};

console.log(g()); // ??

setTimeout(() => {
  console.log("done");
}, 10);

// More examples of this in 06.functional.js...
