%option noyywrap

%{
#include <stdio.h>
#include <string.h>

int id_count = 0;
int op_count = 0;
int kw_count = 0;

/* C language keywords */
const char *keywords[] = {
    "auto","break","case","char","const","continue","default","do",
    "double","else","enum","extern","float","for","goto","if","int",
    "long","register","return","short","signed","sizeof","static",
    "struct","switch","typedef","union","void","volatile","while"
};
int n_keywords = sizeof(keywords) / sizeof(keywords[0]);
%}

/* Definitions for identifiers and operators */
ID        [A-Za-z_][A-Za-z0-9_]*
OPERATOR  "=="|"<="|">="|"!="|"->"|"<<"|">>"|"\+\+"|"--"|"\+="|"-="|"*="|"/="|"%="|"&="|"|="|"^="|"<<="|">>="|"&&"|"||"|[+\-*/%<>=!&|^~?:]

%%

{ID}      {
              /* Check if yytext matches any keyword */
              int is_kw = 0;
              for (int j = 0; j < n_keywords; j++) {
                  if (strcmp(yytext, keywords[j]) == 0) {
                      kw_count++;
                      is_kw = 1;
                      break;
                  }
              }
              if (!is_kw) {
                  id_count++;
              }
          }

{OPERATOR}  { op_count++; }

[ \t\n]+    ;    /* skip whitespace */

.           ;    /* skip all other characters */

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("fopen input");
            return 1;
        }
    }
    yylex();
    printf("Keywords:   %d\n", kw_count);
    printf("Identifiers:%d\n", id_count);
    printf("Operators:  %d\n", op_count);
    return 0;
}