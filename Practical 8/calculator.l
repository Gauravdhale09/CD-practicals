%{
#include "calculator.tab.h"
%}

%%

[0-9]+ {
    yylval = atoi(yytext);
    return DIGIT;
}

[a-zA-Z]+ {
    yylval = strdup(yytext);
    return ID;
}

[ \t\n] {
    // Ignore whitespace and newline characters
}

. {
    return yytext[0];
}

%%

int yywrap() {
    return 1;
}
