%{
#include <stdio.h>
int lines = 0, words = 0, s_letters = 0, c_letters = 0, num = 0, spl_char = 0, total = 0;
%}

%%
\n          { lines++; words++; }
[\t ' ']    { words++; }
[A-Z]       { c_letters++; }
[a-z]       { s_letters++; }
[0-9]       { num++; }
.           { spl_char++; }

%%

int main(void)
{
    yyin = fopen("abc.txt", "r");
    if (yyin == NULL) {
        fprintf(stderr, "Error: Unable to open file 'abc.txt'\n");
        return 1;
    }
    
    yylex();
    total = s_letters + c_letters + num + spl_char;
    
    printf("This file contains:\n");
    printf("\t%d lines\n", lines);
    printf("\t%d words\n", words);
    printf("\t%d small letters\n", s_letters);
    printf("\t%d capital letters\n", c_letters);
    printf("\t%d digits\n", num);
    printf("\t%d special characters\n", spl_char);
    printf("\tIn total %d characters.\n", total);

    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}
