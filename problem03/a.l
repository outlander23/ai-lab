%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
%}

%%
[0-9]+                  { printf("Found: %s\n", yytext); }  // Matches numbers
[^\n]+                  { printf("Not found: %s\n", yytext); }  // Matches sequences of unmatched characters
\n                      { /* Ignore newlines */ }
%%

int main() {
    yylex();
    return 0;
}