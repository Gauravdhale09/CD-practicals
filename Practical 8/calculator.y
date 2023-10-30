%{
#include <stdio.h>
%}

%token DIGIT ID

%%

expression : expression '+' expression
           | expression '*' expression
           | '(' expression ')'
           | DIGIT
           | ID
           ;

%%

int yylex() {
    // Code for tokenization
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
