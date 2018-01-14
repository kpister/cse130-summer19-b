// classes + function constructors

let Car = function (make, model) {
  this.make = make;
  this.model = model;
};

let car1 = new Car("toyota", "camry");

console.log(car1.make, car1.model); // ??

// We can even make private fields!
Car = function (make, model, year) {
  let private_year = year;

  this.make = make;
  this.model = model;
}

let car2 = new Car("honda", "civic", 2018)

console.log(car2.make, car2.model); // ??
console.log(car2.private_year); // ??
console.log(car2.year); // ??

// Private methods?
Car = function (make, model, year) {
  let private_year = year;

  this.make = make;
  this.model = model;

  function private_getInternalLabel () {
    return `${make}@${model}`;
  }

  this.toString = function () {
    return `${private_getInternalLabel()}@${private_year}`
  };
}

let car3 = new Car("ford", "edge", 2018);

console.log(car3.private_getInternalLabel()); // ??
console.log(car3.toString()); // ??
