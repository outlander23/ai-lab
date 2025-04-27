%{
#include <stdio.h>
%}

%%
[0-9]+(\.[0-9]+)?[eE][+-]?[0-9]+    { printf("Exponential number found: %s\n", yytext); }
.|\n                                { /* skip */ }
%%

int main(void) {
    printf("Enter done input (Ctrl+D to end):\n");
    yylex();
    return 0;
}