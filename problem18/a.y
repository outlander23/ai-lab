%{
#include <stdio.h>
%}

%token FOR LPAREN RPAREN SEMI LBRACE RBRACE ID ASSIGN LT LE PLUS INCR NUMBER

%%

program : statement { printf("Valid\n"); }
        ;

statement : iteration_statement
          | compound_statement
          | expression_statement
          ;

compound_statement : LBRACE statement_list RBRACE
                   ;

statement_list : statement
               | statement_list statement
               ;

expression_statement : SEMI
                     | expression SEMI
                     ;

opt_expression : /* empty */
               | expression
               ;

expression : ID
           | NUMBER
           | ID ASSIGN expression
           | expression LT expression
           | expression LE expression
           | expression PLUS expression
           | ID INCR
           ;

iteration_statement : FOR LPAREN opt_expression SEMI opt_expression SEMI opt_expression RPAREN statement
                    ;

%%

int yyerror(char *s) {
    printf("%s\n", s);
    return 0;
}

int main() {
    yyparse();
    return 0;
}