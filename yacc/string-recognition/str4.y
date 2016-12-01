// recognize A^* B^*
%{
#include<stdio.h>
int yylex();
int flag = 0;
%}
%token A B
%%
str :t1 S '\n' {return 0;}
t1  :t1 A | ;
S   :S B  | ;
%%
void main() {
printf("Enter the string : \n");
yyparse();
if(flag == 0) {
printf("Valid String \n");
}
}
yyerror() {
printf("Invalid String \n");
flag = 1;
}
int yywrap() {
return 1;
}
