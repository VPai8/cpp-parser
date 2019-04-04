%{
#include "test.tab.h"
%}
%option yylineno
%%
"main" {return MAIN;}
"(" {return OB;}
")" {return CB;}
"{" {return OFB;}
"}" {return CFB;}
"," {return COMMA;}
";" {return SC;}
"=" {return EQU;}
"!=" {return NEQU;}
"<=" {return LT;}
">=" {return GT;}
">" {return G;}
"<" {return L;}
"[" {return OSB;}
"]" {return CSB;}
"+" {return PLUS;}
"-" {return MINUS;}
"*"	{return MUL;}
"/"	{return DIV;}
"%"	{return MOD;}
"int" {return INT;}
"char" {return CHAR;}
"for" {return FOR;}
"while" {return WHILE;}
"if" {return IF;}
"else" {return ELSE;}
[0-9]+ {return NUM;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
%%
int yywrap(){
	return 1;
}
void yyerror(const char *str){
    fprintf(stderr,"Error | Line: %d\n%s\n",yylineno,str);
}