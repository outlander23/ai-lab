%option noyywrap case-insensitive
%{
#include <stdio.h>
%}

/* digit sequences, with optional fraction */
D       [0-9]+(\.[0-9]+)?
%%
[ \t\n]+                  { /* skip whitespace */ }

{D}[+-]{D}i               { printf("Complex (a+bi) found: %s\n", yytext); }
[+-]?{D}i                 { printf("Pure imaginary found: %s\n", yytext); }

.                         { /* ignore */ }
%%

int main(void) {
    yylex();
    return 0;
}