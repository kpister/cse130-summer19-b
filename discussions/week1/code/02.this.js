// objects + this

let obj = {
  x: 1,
  y: 2,
  swap: function () {
    let temp = this.x;
    this.x = this.y;
    this.y = temp;
  }
};

console.log(obj.x, obj.y); // ??

obj.swap();

console.log(obj.x, obj.y); // ??

let obj2 = {
  x: 3,
  y: 4
}

console.log(obj2.x, obj2.y); // ??

obj.swap.call(obj2);

console.log(obj2.x, obj2.y); // ??
console.log(obj.x, obj.y); // ??

swapObj2 = obj.swap.bind(obj2);

swapObj2();
console.log(obj2.x, obj2.y); // ??

swapObj2();
console.log(obj2.x, obj2.y); // ??

// Also works with regular functions (not belonging to an object)...
function f () {
  console.log(this.x, this.y);
}

f.call(obj2);
console.log(obj2.x, obj2.y); // ??

// And also works with arguments...
function g (arg1) {
  console.log(this.x, this.y, arg1);
}

g.call(obj2, "argument 1"); // ?
