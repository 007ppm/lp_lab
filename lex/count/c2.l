%{
//PROGRAM TO COUNT NO OF LINES,VOWELS& CONSONANTS
#include<stdio.h>
int vowel=0,cons=0,n_line=0;
%}
%%
[aeiouAEIOU]    vowel++; 
[a-zA-Z]        cons++;  
\n              n_line++;
.               ;
%%
void main(){
yyin=fopen("test","r");
yylex();
printf("NO OF VOWELS :%d\nNO OF CONSONANTS :%d\nNO OF NEW LINES :%d\n",vowels,cons,n_line);
}
int yywrap(){
return 1;
}
