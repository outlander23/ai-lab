%option noyywrap

%{
#include <stdlib.h>
#include "a.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]+      ;
\n          { return '\n'; }
[()+\-*/]   { return yytext[0]; }
.           ;
%%