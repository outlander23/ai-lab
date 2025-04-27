%option noyywrap
%{
#include "abnm.tab.h"
extern void yyerror(const char *);
%}

%%

a           { return 'a'; }
b           { return 'b'; }
c           { return 'c'; }
\n          { return '\n'; }
[ \t]+      ;            /* skip whitespace */
.           { return yytext[0]; }  /* any other char → trigger parse error */
%%