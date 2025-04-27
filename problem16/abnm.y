%{
#include <stdio.h>
#include <stdlib.h>

/* Suppress default error message; will handle per‐line rejection */
void yyerror(const char *s) { /* no-op */ }
int yylex(void);
%}

%start lines

%%

lines
    : /* empty */
    | lines line
    ;

line
    : S '\n'        { printf("Accepted\n"); }
    | error '\n'    { printf("Rejected\n"); yyerrok; }
    ;

S
    : X Y
    ;

X
    : /* n=0 */
    | 'a' X 'b'     /* consume one a…b pair */
    ;

Y
    : /* m=0 */
    | 'b' Y 'c'     /* consume one b…c pair */
    ;

%%

int main(void) {
    return yyparse();
}