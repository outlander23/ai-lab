%{
#include <stdio.h>
%}

%%
[A-Z][a-zA-Z]+[ \t]+[a-zA-Z]+[ \t]+[a-zA-Z]+![ \t]*$    { printf("Matched: %s\n", yytext); }
.|\n                                                    { /* Ignore other characters */ }
%%

int main() {
    printf("Starting lexer...\n");
    yylex();
    printf("Finished.\n");
    return 0;
}