%option noyywrap
%{
#include "ab.tab.h"
extern void yyerror(const char *);
%}

%%

a           { return 'a'; }
b           { return 'b'; }
\n          { return '\n'; }
[ \t]+      ;               /* skip spaces and tabs */
.           { /* any other char */ return yytext[0]; }
%%