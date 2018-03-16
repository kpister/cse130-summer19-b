### Lecture slides

* (Last week) intro to constant-time: [pdf](../week9/slides/constant-time.pdf), [key](../weeek9/slides/constant-time.key),
* Constant-time programming in C: [pdf](slides/constant-time-c.pdf), [key](slides/constant-time-c.key),
* Constant-time programming in FaCT: [pdf](slides/constant-time-fact.pdf), [key](slides/constant-time-fact.key),

### Recommended reading

* [FaCT: A Flexible, Constant-Time Programming Language](https://cseweb.ucsd.edu/~dstefan/pubs/cauligi:2017:fact.pdf) by Cauligi et al.
* [FaCT Language Reference](https://github.com/PLSysSec/FaCT/wiki/FaCT-Language-Reference)
* [Crypto coding rules](https://cryptocoding.net/index.php/Coding_rules#Avoid_table_look-ups_indexed_by_secret_data) is an excellent source for transforming C code to constant-time C code.
* [Constant-Time Toolkit](https://github.com/pornin/CTTK) by Thomas Pornin
* [On Subnormal Floating Point and Abnormal Timing](https://cseweb.ucsd.edu/~dkohlbre/papers/subnormal.pdf) by Andrysco, et al.
* [Cache-timing attacks on AES](https://cr.yp.to/antiforgery/cachetiming-20050414.pdf) by Daniel J. Bernstein
* (Last week) [Why Constant-Time Crypto](https://www.bearssl.org/constanttime.html) by Thomas Pornin

### Code snippets

### FaCT example

```
{!lectures/week10/code/tutorial.fact!}
```

#### Compiler-introduced branches

```c
{!lectures/week10/code/cond_assign.c!}
```

Compiled with clang 3.9.1 with `-O2`, introduces a branch:

```llvm
{!lectures/week10/code/cond_assign.ll!}
```

<a href="https://godbolt.org/#g:!((g:!((g:!((h:codeEditor,i:(j:1,lang:c%2B%2B,source:'%23include+%3Cstdint.h%3E%0A%23include+%3Cstdbool.h%3E%0A%23include+%3Cstdlib.h%3E%0A%0Avoid+mpi_safe_cond_assign(+uint8_t+*X,+const+uint8_t+*Y,+size_t+len,+unsigned+char+assign+)%0A+%7B%0A+++++size_t+i+%3D+0%3B%0A+%0A++++/*+make+sure+assign+is+0+or+1+*/%0A++++assign+%3D+(+assign+!!%3D+0+)%3B%0A++++/*+make+sure+assign+is+0+or+1+in+a+time-constant+manner+*/%0A++++//assign+%3D+(assign+%7C+(unsigned+char)-assign)+%3E%3E+7%3B%0A+%0A++++//for(i+%3D+0+%3B+i+%3C+len%3B+i%2B%2B+)%0A+++++++++X%5Bi%5D+%3D+X%5Bi%5D+*+(+1+-+assign+)+%2B+Y%5Bi%5D+*+assign%3B%0A+%7D'),l:'5',n:'0',o:'C%2B%2B+source+%231',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0'),(g:!((h:compiler,i:(compiler:clang391,filters:(b:'0',binary:'1',commentOnly:'0',demangle:'0',directives:'0',execute:'1',intel:'0',trim:'1'),lang:c%2B%2B,libs:!(),options:'-O2',source:1),l:'5',n:'0',o:'x86-64+clang+3.9.1+(Editor+%231,+Compiler+%231)+C%2B%2B',t:'0')),k:50,l:'4',n:'0',o:'',s:0,t:'0')),l:'2',n:'0',o:'',t:'0')),version:4">Play with this code on godbolt</a>
