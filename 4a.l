%{
#include <stdio.h>
int ext(int);
int a[]={0,0,0,0},valid=1,opnd=0,top=-1,i;
%}
%x oper
%%
["("] {top++;}
[")"] {top--;}
[a-zA-Z0-9]+ {BEGIN oper; opnd++;}
<oper>"+" {if(valid) {valid = 0; i = 0;} else ext(0);}
<oper>"-" {if(valid) {valid = 0; i = 1;} else ext(0);}
<oper>"*" {if(valid) {valid = 0; i = 2;} else ext(0);}
<oper>"/" {if(valid) {valid = 0; i = 3;} else ext(0);}
<oper>"(" {top++;}
<oper>")" {top--;}
<oper>[a-zA-Z0-9]+ {opnd++; if(valid == 0) {valid = 1; a[i]++;} else 
ext(0);}
<oper>"\n" {if(valid == 1 && top == -1) {printf("Valid 
expression\n"); return 0;} else ext(0);}
.\n ext(0);
%%
int yywrap() { }
int ext(int x)
{
printf("\nInvalid expression%d\n",x);
exit(0);
}
int main()
{
printf("\nEnter an arithmetic expression\n");
yylex();
printf("Number of operands = %d\n",opnd);
printf("Number of + = %d\n",a[0]);
printf("Number of - = %d\n",a[1]);
printf("Number of * = %d\n",a[2]);
printf("Number of / = %d\n",a[3]);
return 0;
}

