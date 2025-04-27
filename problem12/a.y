%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

input:
    /* empty */
  | input line
  ;

line:
    '\n'
  | expr '\n'   { printf("%d\n", $1); }
  ;

expr:
    NUMBER               { $$ = $1; }
  | expr '+' expr        { $$ = $1 + $3; }
  | expr '-' expr        { $$ = $1 - $3; }
  | expr '*' expr        { $$ = $1 * $3; }
  | expr '/' expr        {
                            if ($3 == 0) {
                              fprintf(stderr, "error: division by zero\n");
                              exit(1);
                            }
                            $$ = $1 / $3;
                          }
  | '-' expr %prec UMINUS { $$ = -$2; }
  | '(' expr ')'         { $$ = $2; }
  ;

%%

void yyerror(const char *s) { fprintf(stderr, "%s\n", s); }

int main(void) {
    return yyparse();
}