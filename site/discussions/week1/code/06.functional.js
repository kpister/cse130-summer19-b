// functional stuff!

const array = [1, 2, 3];

let newArray = array.map((x) => x + 1);
console.log(newArray); // ??

newArray = array.reduce((accum, x) => accum + x, 0);
console.log(newArray); // ??

newArray = array.filter((x) => x <= 2);
console.log(newArray); // ??

newArray = array.filter((x) => x > 2);
console.log(newArray); // ??
