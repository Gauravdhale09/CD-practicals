%{
#include <stdio.h>
int comment_count = 0; // Counter for comments
%}

%%

"//".* {
    comment_count++; // Increment comment count
    FILE* comments_file = fopen("new.txt", "a");
    if (comments_file != NULL) {
        fprintf(comments_file, "%s\n", yytext);
        fclose(comments_file);
    }
}

"/*" {
    comment_count++; // Increment comment count
    FILE* comments_file = fopen("new.txt", "a");
    if (comments_file != NULL) {
        fprintf(comments_file, "%s", yytext);
        fclose(comments_file);
    }
    while (1) {
        int c = input();
        if (c == EOF) break;
        if (c == '*' && input() == '/') break;
    }
}

<INITIAL><<EOF>> {
    return 1; // Indicate that there are no more files to process
}

%%

int yywrap() {
    return 1; // Indicate that there are no more files to process
}

int main() {
    yyin = fopen("Test.c", "r");
    if (yyin == NULL) {
        printf("Failed to open input file.\n");
        return 1;
    }

    yylex(); // Start lexical analysis

    fclose(yyin);

    printf("Comments removed and saved to new.txt.\n");
    printf("Total comments: %d\n", comment_count);

    return 0;
}
