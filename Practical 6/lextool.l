%{
#include <stdio.h>
%}

DIGIT   [0-9]
ID      [a-zA-Z][a-zA-Z0-9]*
WS      [ \t\n]

%%

{DIGIT}+    { printf("Integer: %s\n", yytext); }
{ID}        { printf("Identifier: %s\n", yytext); }
"+"         { printf("Plus Operator\n"); }
"-"         { printf("Minus Operator\n"); }
"*"         { printf("Multiplication Operator\n"); }
"/"         { printf("Division Operator\n"); }
{WS}        ;  /* Skip whitespace */

.           { printf("Invalid character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
