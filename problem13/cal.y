%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
int yyerror(char *s);
%}

%union {
    char *str;
}

%token <str> VARIABLE
%token EOL
%token INVALID

%%

input:
    /* empty */
    | input line
    ;

line:
      VARIABLE EOL { printf("Valid variable: %s\n", $1); free($1); }
    | INVALID EOL  { printf("Invalid variable!\n"); }
    | EOL          { /* ignore empty lines */ }
    ;

%%

int main() {
    printf("Enter variable names (Ctrl+D to exit):\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}
