%option noyywrap

%{
#include <stdlib.h>
#include "plus.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]+      ;                /* skip whitespace */
[()+\-*/]   { return yytext[0]; }
\n          { return '\n'; }
.           { return yytext[0]; }
%%