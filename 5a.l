%{
#include<stdio.h>
int idc=0;
%}
e[=][ ]*[0-9]+
ws[ \n\t]*
id[_a-zA-Z][_a-zA-Z0-9]*
decln "int"|"float"|"clear"|"double"|"short"|"long"|"unsigned"
%x defn
%%
{decln} {BEGIN defn;}
<defn>{ws}{id}{ws}\, {idc++;}
<defn>{ws}{id}{ws}\; {BEGIN 0;idc++;}
<defn>{ws}{id}{ws}{e}{ws}\, {idc++;}
<defn>{ws}{id}{ws}{e}{ws}\; {BEGIN 0;idc++;}
<*>\n ;
<*>. ;
%%
int yywrap() { }
int main(int argc,char *argv[])
{
if(argc==2)
{
yyin=fopen(argv[1],"r");
yylex();
printf("\nNumber of identifiers = %d\n",idc);
}
else
{
printf("\nUsage : %s <src_file> \n",argv[0]);
}
return 0;
}

