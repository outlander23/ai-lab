%{
#include "cal.tab.h"
#include <string.h>
%}

%option noyywrap

%%

[A-Za-z][A-Za-z0-9]*    { yylval.str = strdup(yytext); return VARIABLE; }
[\n]                    { return EOL; }
[ \t]                   ;   // ignore whitespace

[^ \t\n]+               { yylval.str = strdup(yytext); return INVALID; }


%%