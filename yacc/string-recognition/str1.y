// for recognizing : A^n B^n
%{
	#include<stdio.h>
	int yylex();
	int flag = 0;
%}
%token A B
%%
str : S '\n' {return 0;}

S : A S B
  |
  ;
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
