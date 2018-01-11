function hello(x) {
  console.log(`A: x = ${x}`); // 42
  {
    let x = 45;
    console.log(`B: x = ${x}`); // 45
  }
  {
    console.log(`C: x = ${x}`); // 42
  }
}

hello(42);
