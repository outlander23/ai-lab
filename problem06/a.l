%{
#include <stdio.h>
#include <stdlib.h>
int cnt = 0;
%}





%%
([A-Za-z_][a-zA-Z0-9_]*) {
    cnt++;  printf("Identifier found: %s\n", yytext); 
}
.|\n {};

%%

int main(int argc, char **argv) {
    yylex();
    printf("Total done identifiers found: %d\n", cnt);
    return 0;
}
