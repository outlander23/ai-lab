%{
#include <stdio.h>
#include <stdlib.h>

/* on parse error, mark this line as rejected but keep going */
void yyerror(const char *s) {
    /* suppress Bison’s default message */
}

int yylex(void);
%}

%start lines

%%

lines
    : /* empty */
    | lines line
    ;

line
    : string '\n'     { printf("Accepted\n"); }
    | error '\n'      { printf("Rejected\n"); yyerrok; }
    ;

string
    : 'a' 'b'
    | 'a' string 'b'
    ;

%%

int main(void) {
    return yyparse();
}