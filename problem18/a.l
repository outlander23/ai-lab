%{
#include "a.tab.h"
%}

%%
"for" { return FOR; }
"(" { return LPAREN; }
")" { return RPAREN; }
";" { return SEMI; }
"{" { return LBRACE; }
"}" { return RBRACE; }
"=" { return ASSIGN; }
"<" { return LT; }
"<=" { return LE; }
"+" { return PLUS; }
"++" { return INCR; }
[0-9]+ { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n]+ ; /* ignore whitespace */
. { printf("Unknown character: %s\n", yytext); }
%%

int yywrap() { return 1; }