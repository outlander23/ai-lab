%option case-insensitive
%{
#include <stdio.h>
%}

%%
[ \t\n]+                         { /* skip whitespace */ }

am|is|are|was|were|be|being|been { 
                                   /* matched a “to be” verb as a whole token */
                                   printf("To‑be verb found: %s\n", yytext);
                                 }

[[:alpha:]]+                     { 
                                   /* any other word */
                                   printf("Other word found: %s\n", yytext);
                                 }


.                                { /* skip */ }
%%

int main(void) {
    printf("Enter done done text (Ctrl+D to end):\n");
    yylex();
    return 0;
}