// hoisting

{
  console.log(undeclared); // ??
}

{
  console.log(let_declared_later); // ??
  let let_declared_later;
}

{
  console.log(var_declared_later); // ??
  var var_declared_later;
}

{
  console.log(defined_later()); // ??
  function defined_later () {
    return "yay!";
  }
}

{
  console.log(let_defined_later()); // ??
  let let_defined_later = function () {
    return "yay!";
  };
}
