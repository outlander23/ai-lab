%{
#include <stdio.h>
%}

%%
\n      { printf("hello word\n"); }
.       {  }
%%

int main()
{
    yylex();
    return 0;
}