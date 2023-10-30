#include <stdio.h>
#include <string.h>

int main() {
    int state = 1;
    char input[21];
    int len;

    printf("Enter a string to check DFA with a maximum of 20 characters:\n");
    scanf("%s", input);

    len = strlen(input);

    if (len > 20) {
        printf("Limit Exceeded\n");
        return 0;
    }

    for (int i = 0; i < len; i++) {
        if (input[i] != 'a' && input[i] != 'b') {
            printf("Not Valid\n");
            return 0;
        }
    }

    for (int i = 0; i < len; i++) {
        if (input[i] == 'a' && (state == 1 || state == 2 || state == 3 || state == 4)) {
            state = 2;
        } else if (input[i] == 'b' && (state == 1 || state == 4)) {
            state = 1;
        } else if (input[i] == 'b' && state == 2) {
            state = 3;
        } else if (input[i] == 'b' && state == 3) {
            state = 4;
        }
    }

    if (state == 4) {
        printf("Input string forms the DFA for (a/b)*abb\n");
    } else {
        printf("Input string does not form the DFA for (a/b)*abb\n");
    }

    return 0;
}
