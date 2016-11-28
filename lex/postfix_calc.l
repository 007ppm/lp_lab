%{
#include<stdio.h>
#include<stdlib.h>
#define SIZE 50
static int sp=0;
static int stack[SIZE];
static void push(int item){
  if(++sp>SIZE){
printf("error :stack overflow");
     }
  else{
  stack[sp]=item;
     }
}

static int pop(){
  if(sp>=0){
         return stack[sp--];
    }
   else{
   printf("error: stack underflow");
   }
}
%}
%%
[0-9]         {push(atoi(yytext));}
"+"           {push(pop() + pop());}
"*"           {push(pop() * pop());}
"-"           {int rhs=pop();push(pop()-rhs);}
"/"           {int rhs=pop();push(pop()/rhs);}
;             {printf("\nRESULT = %d",pop());}
%%
void main(){
yylex();
}
int yywarap(){
return 1;
}
