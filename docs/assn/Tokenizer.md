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

We will grade largely on effort put into the project, however we also expect to be able to run your tokenizer on a few sample files of the language it reads. 
In your Gradescope submission, please include at least 3 files which your tokenizer can parse, as well as a README file as described below.

### Required README:

Please include with your tokenizer a README.md file which answers the following questions:

1. What language is your tokenizer written in?

2. What language are you tokenizing?

3. How do you run your tokenizer?

4. What is the output format of your tokenizer?

5. What sorts of errors can your tokenizer handle?

### Notes

PL is often the precursor to Compilers (CSE 131) because the ideas that we discuss in class make their way into languages through a compiler.

Compilers are often divided into 4 key parts: Lexer (tokenizer), Parser, Semantic Analysis, Code Generation. With this start, I encourage you to try building the next stages for your language as well!

This document will continue to grow over the next few weeks. Check back online for updated versions with more advice.


## Guide

If you are looking for some advice on how to start your project, see below. Otherwise this can be ignored.

### Step 1. Make Choices

Choose a language you want to write your code in, my go to choice is Python, but for a language task Haskell might be perfect.

Next choose or create a language you want to parse. This step could take a while. 
Feel free to google around for [esoteric languages](https://en.wikipedia.org/wiki/Esoteric_programming_language) like Brainf\*ck, 
or use something we covered like uHaskell or Lambda Calculus. 

If you want to create a language, start by creating a subset of a current language: uGo for example.

### Step 2. Establish the Lexicon

Compile a list of each token that could exist in your language.
These are things like identifiers, brackets, the primative times, etc. Some languages have a lot!

### Step 3. Write the Lexer

Write some code to parse a file, generally splitting on whitespace (though that doesn't work for [whitespace](https://en.wikipedia.org/wiki/Esoteric_programming_language#whitespace)).
With each token, figure out what part of the lexicon it might be, and add that to your list.

### Step 4. Celebrate! [Optional]


### Step 5. Build a Parser. [Optional, extra credit??]

Once you have a list of the source code tokens, you can start to parse them into expressions.
This step requires further independent research.
