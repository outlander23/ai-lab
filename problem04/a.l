%{
#include <stdio.h>

%}


%%
\+88015[0-9]{8}    { printf("Valid\n"); }    // Matches valid Teletalk number
[^\n]+             { printf("Invalid\n"); } // Matches any other input on the same line
\n                 { /* Ignore newlines */ } // Ignores newlines
%%


int main() {
    yylex();
    return 0;
}