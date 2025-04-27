%{
#include <stdio.h>

// Initialize counters
int char_count = 0;
int word_count = 0;
int space_count = 0;
int line_count = 0;
%}

%%
[ \t]+       { space_count += yyleng; char_count += yyleng; } // Match spaces/tabs, update counts
[a-zA-Z0-9]+ { word_count++; char_count += yyleng; }         // Match words, update word and character counts
\n           { line_count++; char_count++; }                // Match newline, update line and character counts
.            { char_count++; }                              // Match any other single character
%%

int main() {
    printf("Enter done your input (Press CTRL+D to end):\n");
    yylex(); // Start lexical analysis
    printf("\nTotal characters: %d\n", char_count);
    printf("Total words: %d\n", word_count);
    printf("Total spaces: %d\n", space_count);
    printf("Total lines: %d\n", line_count);
    return 0;
}