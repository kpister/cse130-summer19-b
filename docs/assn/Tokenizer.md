## Tokenizer

This part of the assignment is more freeform than the other PA's.
Your task is to create the first piece of a compiler pipeline for a language of your choosing (including a language which you design). 
A tokenizer can loosely be written as a function f :: Token a => File -> [a]

This program can be written in any language you choose.

### Ideas

To give some contextual ideas a subset of the tokens used in C would include \{ Identifier, Left Bracket, Right Bracket, Int, Char, IF, ASSIGN, Int Literal \}

For reference, C has a total of over 40 different possible tokens. 

Given a C file such as

```
int main() {
    int a = 3;
    return a;
}
```

The ideal tokenization would be:

```
[INT, IDENTIFIER, LEFT PARENS, RIGHT PARENS, LEFT BRACKET, INT, IDENTIFIER, ASSIGN, INT LITERAL, SEMICOLON, RETURN, IDENTIFIER, SEMICOLON, RIGHT BRACKET, EOF]
```


*You have free reign over the language you are tokenizing, I would recommend something simpler than C. A potentially simple one to do would be Lambda Calculus.*

### Grading

We will grade largely on effort put into the project, however we also expect to be able to run your tokenizer on a few sample files of the language it reads. In your Gradescope submission, please include at least 3 files which your tokenizer can parse.

### Notes

PL is often the precursor to Compilers (CSE 131) because the ideas that we discuss in class make their way into languages through a compiler.

Compilers are often divided into 4 key parts: Lexer (tokenizer), Parser, Semantic Analysis, Code Generation. With this start, I encourage you to try building the next stages for your language as well!

This document will continue to grow over the next few weeks. Check back online for updated versions with more advice.
