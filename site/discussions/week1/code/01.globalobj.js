// global object

console.log(this === global); // ??

{
  console.log(this === global); // ??
}

function f () {
  console.log(this === global);
}

f(); // ??

new f(); // ??

(function () {
  "use strict";
  console.log(this === global); // ??
})();
