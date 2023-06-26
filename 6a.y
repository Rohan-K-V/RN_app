%{
#include <stdio.h>
#include<stdlib.h>
%}
%token NUM ID
%left '+''-'
%left '/''*'

%%
expr:e {printf("Valid expression\n"); return 0;}
e:e'+'e 
| e'-'e 
| e'*'e 
| e'/'e 
| '('e')' 
| NUM 
| ID      ;
%%
int yywrap() {   }
int main()
{
printf("\nType the expression\n");
yyparse();
return 0;
}
int yyerror()
{
printf("\nInvalid expression\n");
return 0;
} 
