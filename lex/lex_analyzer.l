//minial model of lexical analyser for c progm 
%{
#include<stdio.h>
%}
digit [0-9]
letter [a-zA-Z]
keyword "if"|"else"|"int"|"char"|"scanf"|"printf"|"switch"|"return"|"struct"|"do"|"while"|"void"|"for"|"float"
escape "\a"|"\\n"|"\\b"|"\t"|"\\t"|"\b"|"\\a"
operator "&&"|"<"|">"|"<="|">="|"="|"+"|"-"|"?"|"*"|"/"|"%"|"&"|"||"
splchara "{"|"}"|"["|"]"|"("|")"|"#"|"'"|"."|"\""|"\\"|";"|","
fspecifier "%d"|"%s"|"%c"|"%f"|"%e"
%%
#include<.+>                                    printf("\n%s\tis a header file",yytext);
{digit}+("E"("+"|"-")?{digit}+)?                printf("\n%s\tis real number",yytext);
{digit}+"."{digit}+("E"("+"|"-")?{digit}+)?     printf("\n%s\t is floating pt no ",yytext);
{keyword}                                       printf("\n%s\t is keywords",yytext);
{escape}                                        printf("\n%s\tis Escape sequences",yytext);
{letter}({letter}|{digit})*                     printf("\n%s\tis identifier",yytext);
{operator}                                      printf("\n%s\toperator ",yytext);
{splchara}                                      printf("\n%s\t is a special character",yytext);
{fspecifier}                                    printf("\n%s\tis a format specifier",yytext);
%%
int yywrap()  {
 return 1;
}
void main(int argc,char *argv[])  {
yyin=fopen(argv[1],"r");
yylex();
}
