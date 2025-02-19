# CMSC-430-Project-1
The first project involves modifying the attached lexical analyzer and the compilation listing generator code.

CMSC 430 - Project 1: Lexical Analyzer
Author: Philip S
Course: CMSC 430 - Compiler Theory and Design

Project Overview
This project implements a lexical analyzer using Flex to scan input text and identify valid tokens for a hypothetical programming language. The analyzer reads an input file, processes it according to defined lexical rules, and outputs recognized tokens along with their classifications.

Features
Reads input from a file containing source code in the target language.
Identifies valid tokens, including:
Keywords
Identifiers
Operators
Numeric literals
Special characters (e.g., parentheses, semicolons)
Reports unrecognized tokens as lexical errors.
Displays tokenized output in a structured format.
Handles reserved words and translation rules efficiently.
Files Included
scanner.l → Flex specification file defining lexical rules.
Makefile → Automates compilation using flex and gcc.
test1.txt → Sample test case for verifying token recognition.
README.md → This document.
Setup & Compilation
Prerequisites
Flex (Fast Lexical Analyzer)
GCC (GNU Compiler Collection)
Make (Build automation tool)
Compilation Steps
Open a terminal and navigate to the project directory.
Run the following command to generate and compile the scanner:
bash
Copy
Edit
make
This produces an executable named scanner.
Running the Scanner
To test the lexical analyzer, run:

bash
Copy
Edit
./scanner < test1.txt
This reads the input file and prints the identified tokens.

Testing
Sample Input (test1.txt)
go
Copy
Edit
int x = 10;
if (x > 5) { print(x); }
Expected Output
makefile
Copy
Edit
KEYWORD: int
IDENTIFIER: x
OPERATOR: =
NUMBER: 10
SPECIAL: ;
KEYWORD: if
SPECIAL: (
IDENTIFIER: x
OPERATOR: >
NUMBER: 5
SPECIAL: )
SPECIAL: {
IDENTIFIER: print
SPECIAL: (
IDENTIFIER: x
SPECIAL: )
SPECIAL: ;
SPECIAL: }
Error Handling
Reports invalid tokens encountered in the source file.
Provides an error message with the invalid token and its position.
Possible Improvements
Extend token recognition for floating-point numbers.
Implement multi-line comments handling.
Enhance error reporting with line numbers.
Lessons Learned
Understanding regular expressions for tokenization.
Using Flex to generate an efficient lexical analyzer.
Managing input file reading and error handling in a compiler project.

License***
This project is for educational purposes in CMSC 430 and follows standard academic guidelines.
