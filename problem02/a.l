%{
#include <stdio.h>
%}

%%
([A-Z][a-z]+)[ \s]+([a-z0-9]+)    { printf("Matched: %s\n", yytext); }
.|\n                              { /* Ignore other characters */ }
%%

int main() {
    printf("Starting lexer...\n");
    yylex();
    printf("Finished.\n");
    return 0;
}

int yywrap() {
    return 1;
}