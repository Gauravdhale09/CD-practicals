#include <stdio.h>

int main() {
    FILE *file;
    char filename[] = "abc.txt";
    char ch;
    int charCount = 0, wordCount = 0, spaceCount = 0, lineCount = 0;
    int inWord = 0;

    // Open the file
    file = fopen(filename, "r");

    if (file == NULL) {
        printf("Error opening the file.\n");
        return 1;
    }

    // Read the file character by character
    while ((ch = fgetc(file)) != EOF) {
        charCount++;

        if (ch == ' ' || ch == '\t' || ch == '\n') {
            spaceCount++;

            // If we were in a word, increment the word count
            if (inWord) {
                inWord = 0;
                wordCount++;
            }

            // If it's a newline character, increment line count
            if (ch == '\n') {
                lineCount++;
            }
        } else {
            inWord = 1;
        }
    }

    // Close the file
    fclose(file);

    // Check if the last word in the file wasn't followed by a space or newline
    if (inWord) {
        wordCount++;
    }

    // Print the counts
    printf("Characters: %d\n", charCount);
    printf("Words: %d\n", wordCount);
    printf("Blank Spaces: %d\n", spaceCount);
    printf("Lines: %d\n", lineCount);

    return 0;
}
