#include <stdio.h>
#include <string.h>

int main() {
    char input[1000];
    printf("Enter a line of text: ");
    scanf("%[^\n]", input);  // Read a line of text until the newline character

    if (strstr(input, "//") != NULL) {
        printf("This is a single-line comment.\n");
    } else if (strstr(input, "/*") != NULL && strstr(input, "*/") != NULL) {
        printf("This is a multi-line comment.\n");
    } else {
        printf("This is not a comment.\n");
    }

    return 0;
}
