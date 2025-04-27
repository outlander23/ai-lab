%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

input:
    /* empty */
  | input line
  ;

line:
    '\n'
  | expr '\n'       { printf("Valid expression\n"); }
  | error '\n'      { printf("Invalid expression\n"); yyerrok; }
  ;

expr:
    NUMBER
  | expr '+' expr
  | expr '-' expr
  | expr '*' expr
  | expr '/' expr
  | '(' expr ')'
  ;

%%

void yyerror(const char *s) {
    /* suppress default error message */
}

int main(void) {
    return yyparse();
}