%{
#include <stdio.h>
%}

%%
([A-Za-z]+ats?[ \t]*)    { printf("Found: %s\n", yytext); }  // Matches "at" or "ats" words
[^\n]+                   { printf("Not found: %s\n", yytext); } // Matches entire unmatched sequences on a line
\n                       { /* Ignore newlines */ }
%%

int main() {
    yylex();
    return 0;
}