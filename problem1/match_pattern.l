%{
#include <stdio.h>
%}

%%
([A-Z][a-z]+)[ \t]+([a-z0-9]+)    { printf("Match found: First word = %s, Second word = %s\n", yytext, yytext); }
%%

int main() {
    yylex();
    return 0;
}