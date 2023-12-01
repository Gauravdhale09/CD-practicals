%{
#include <stdio.h>
%}

%token NUM
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

calclist: /* nothing */
    | calclist exp '\n' { printf("= %d\n", $2); }
    ;

exp: NUM
    | exp '+' exp   { $$ = $1 + $3; }
    | exp '-' exp   { $$ = $1 - $3; }
    | exp '*' exp   { $$ = $1 * $3; }
    | exp '/' exp   { $$ = $1 / $3; }
    | '(' exp ')'   { $$ = $2; }
    | '-' exp %prec UMINUS  { $$ = -$2; }
    ;

%%

int main()
{
    yyparse();
}

int yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
    return 0;
}
