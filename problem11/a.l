%option noyywrap case-insensitive
%{
#include <stdio.h>
#include <string.h>

static int cc, sc;
static const char *coord[] = {
    "and","but","or","nor","for","so","yet",NULL
};
static const char *sub[] = {
    "because","although","though","since","unless",
    "when","while","after","before","if","that",NULL
};

static void classify(void) {
    if (cc == 0 && sc == 0)
        puts("Simple sentence");
    else if (cc > 0 && sc == 0)
        puts("Compound sentence");
    else if (cc == 0 && sc > 0)
        puts("Complex sentence");
    else
        puts("Compound-complex sentence");
    cc = sc = 0;
}
%}

%%
[[:alpha:]]+  {
                     for (int i = 0; coord[i]; ++i)
                         if (strcasecmp(yytext, coord[i]) == 0) { ++cc; }
                     for (int i = 0; sub[i]; ++i)
                         if (strcasecmp(yytext, sub[i]) == 0) { ++sc; }
}
\n               { classify(); }
.                {}
%%

int main(void) {
    yylex();
    printf("Total done sentences found: %d\n", cc + sc);
    return 0;
}