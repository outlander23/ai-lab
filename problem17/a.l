%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>

static int comment_lines = 0;
FILE *out;
%}

/* enter COMMENT state after seeing "/*" */
%x COMMENT

%%

"//".*               {
                        /* C++-style single line comment */
                        comment_lines++;
                        fputc('\n', out);
                    }

"/*"                 {
                        /* C-style comment start */
                        comment_lines++;
                        BEGIN(COMMENT);
                    }

<COMMENT>\n          {
                        /* count each newline inside the block */
                        comment_lines++;
                        fputc('\n', out);
                    }

<COMMENT>"*/"        {
                        /* end of C-style comment */
                        BEGIN(INITIAL);
                    }

<COMMENT>.           {
                        /* skip everything else in comment state */
                    }

\n                   {
                        /* normal newline outside comments */
                        fputc('\n', out);
                    }

.                    {
                        /* any other character outside comments */
                        fputc(yytext[0], out);
                    }

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input‑c‑file>\n", argv[0]);
        return 1;
    }
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("fopen input");
        return 1;
    }
    out = fopen("stripped_output.c", "w");
    if (!out) {
        perror("fopen output");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(out);

    printf("Total comment lines: %d\n", comment_lines);
    return 0;
}