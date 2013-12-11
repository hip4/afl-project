Logo Project
============

Introduction
------------

This mini-project represents a parser for Logo for Java using JavaCC. The parser was implemented during the module "Automata and formal languages".

Logo
----

The following link gives you a nice and simple introduction to the Logo programming language:

    [A short introduction to Logo by Mike Koss](http://mckoss.com/logo/)

Assignment
----------

Your Logo parser/translator must conform the provided grammar and be able to run all the Logo programs provides as examples without modifications.

First use the provided EBNF grammar to develop a parser with JavaCC. It is important to have a parser that works well before tackle with code generation.

A parser cannot verify all the aspects of correctness of a program. For example: the verification of the number of formal and effective parameters, the fact that variables are defined before their use, or type checking. These verifications are performed generally after the parsing in a phase called "semantics analysis", and before the code generation phase.

However, due to a lake of time in this course, you do not have to cope with such verifications. In other words, your translator has to verify the correctness of a Logo program at the syntactic level only, not at the semantic level. The semantic verification will be perform during the Java compilation of what is produced by your tool.

Add the Java code generation directly into your parser. You do not have to build the parse tree explicitly. Note that your translator has to deal with the REPCOUNT counter and the comments have to be ignored by the parser (not generated into Java code).

Throughout the development or your project you must use the following hierarchy. Your project must be compatible with the ANT utility and the file build.xml that is provided.

      .
      |
      +-- README           // contains in plain text: name of the project
      |                    // names of the authors, class and location,
      |                    // date, version, and remarks
      |
      +-- build.xml        // ant file
      |
      +-- build.properties // properties definitions for ant
      |
      +-- src              // directory: all the source code and tests
      |    |
      |    +-- Logo.jj         // JavaCC source of your parser/translator
      |    +-- LogoPrimitives  // java source of the Logo Primitives
      |    +-- LogoGrammar.txt // the BNF grammar of our Logo language
      |
      +-- doc
      |    |
      |    +-- report.pdf  // your report (PDF format only)
      |
      +-- build            // directory: all generated file .class .java
      |
      +-- logofiles        // some examples of Logo programs
      |
      +-- output           // translated and compiled Logo files
      |
      +-- dist.zip         // zip file that contains the whole projet
      // you have to send me this file only
    

The artifacts mentionned above are gathered into the file dist.zip For your convenience the file Logo.jj is partially developed. You have to add JavaCC and Java code to realize the project. Download this zip file and uncompress it into the directory of your choice. You will obtain the same hierarchy as above (almost the same because some directories are created at compile-time).

Consult the files build.xml and build.properties.

Note that you are not allowed to modify the file build.xml, but feel free to modify build.properties.
Deliverables
Content and format of the deliverable

Deliverable
-----------

The deliverable must contain the following artifacts:

    A short report written in English (PDF format only) made of the following sections:
        First page with title, names of all the authors (Last name, First name, email address), class, location, date, and version.
        Introduction: Description of the problem.
        Grammar: The grammar in plain text format (ASCII) you have used in your translator with a description of thed modifications you have done.
        Solution: Description of your solution. How you have treated certain parts, in particular the translation of the REPCOUNT reserved identifier.
        Test: How you have verified that your solution works well, i.e. the test examples you have used.
        Limitations: Description of the limitations of your approach.
    Your parser/translator Logo.jj.
    The Logo program you have developed to test your parser/translator in logofiles directory.

Use 'ant dist' to make the file 'dist.zip'. Send me this file in attachment. Because I use filters in my mail reader, the subject of your email must be as follows:

LOGO team X, nameofauthor1, nameofauthor2

where X and nameofauthor corresponds to your team number, your first, last name and "Kurzel", respectively. If you do not respect this rule your email might be ignored!

Grammar
-------

  Program    = "LOGO" Identifier { Subroutine } { Statement } "END"

  Subroutine = "TO" Identifier { Parameter } { Statement } "END"

  Statement  = "CS" | "PD" | "PU" | "HT" | "ST" 
             | "FD" NExpr | "BK" NExpr | "LT" NExpr | "RT" NExpr
             | "WAIT" NExpr
             | "REPEAT" NExpr "[" { Statement } "]"
             | "IF" BExpr "[" { Statement } "]"
             | "IFELSE" BExpr "[" { Statement } "]" "[" { Statement } "]"
             | Identifier { NExpr }

  NExpr      = NTerm { ( "+" | "-" )  NTerm }

  NTerm      = NFactor { ( "*" | "/" ) NFactor }

  NFactor    = "-" ( Number | REPCOUNT | Parameter | "(" NExpr ")" ) | 
         Number | REPCOUNT | Parameter | "(" NExpr ")" 

  BExpr      = BTerm { "OR" BTerm }

  BTerm      = BFactor { "AND" BFactor }

  BFactor    = "TRUE" | "FALSE" | "NOT" "(" BExpr ")" 
       | NExpr ( "==" | "!=" | "<" | ">" | "<=" | ">=" )  NExpr 

  Comments start with "#" with scope until the newline

  Numbers are real numbers

  Identifiers start with a letter followed by letters or digits

  Parameters are ":" followed by Identifier

  Identifiers, parameters, keywords in uppercase only


Deadline
--------

Friday 10th January 2014 (week 2) before 17:00.
