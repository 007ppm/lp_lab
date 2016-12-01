%{
#include<stdio.h>
int flag=0;
%}
%token NUM;
%left '+' '-';
%left '*' '/' '%'
%left '(' ')'
%%
exp : E{printf("\n result=%d\n",$$);
return 0;
}
E:E'+'E {$$=$1+$3;}
|E'-'E {$$=$1-$3;}
|E'*'E {$$=$1*$3;}
|E'/'E {$$=$1/$3;}
|'('E')' {$$=$2;}
|NUM {$$=$1;}
;
%%
void main()
{
   printf("Enter Arithmetic Expression\n");
   yyparse();
   if (flag==0){
   printf("VALID\n");
        }
}
yyerror()
{
        flag=1;
   printf("Invalid Expression!!!!!!!");
}
