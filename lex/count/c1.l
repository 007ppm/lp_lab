%{
//PROGRAM TO COUNT NO OF CHARACTERS,NO OF NEW LINES,NO OF WORDS 
#include<stdio.h>
int nchar, nword, nline;
%}
%%
\n         { nline++; nchar++; }
[^ \t\n]+  { nword++, nchar += yyleng; }
.          { nchar++; }
%%
void main() {
    yyin=fopen("test","r");
    yylex();
    printf("CHARACTERS :%d\n WORDS :%d\n NUMBER OF LINES:%d \n", nchar, nword, nline);
    }
int yywrap(){
return 1;
}
  
