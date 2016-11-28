%{
#include<stdio.h>
%}

%%

\/\/.*                   ;
"/*"(.|\n)*"*/"          ;
%%

main()
{
yyin=fopen("mypgm.c","r");
yylex();
}

int yywrap()
{
return 1;
}
