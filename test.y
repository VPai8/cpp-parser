%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	int yyerror();
	extern FILE *yyin;
%}
%locations
%token MAIN OB CB OFB CFB SC INT CHAR COMMA OSB CSB EQU IF ID NUM ELSE WHILE FOR EQQ NEQU LT GT G L PLUS MINUS MUL DIV MOD
%%
program : MAIN OB CB OFB declarations statlist CFB
;
declarations : dtype idlist SC declarations
				|
;
dtype : INT
		| CHAR
;
idlist : ID
		| ID COMMA idlist
		| ID OSB NUM CSB COMMA idlist
		| ID OSB NUM CSB
;
statlist : stat statlist 
			|
;
stat : asstat SC 
		| decstat
		| loopstat
;
asstat : ID EQU expn
;
expn : sexpn eprime
;
eprime : relop sexpn
		|
;
sexpn : term seprime
		|
;
seprime : addop term seprime
			|
;
term : factor tprime
;
tprime : mulop factor tprime
		|
;
factor : ID
		| NUM
;
decstat : IF OB expn CB OFB statlist CFB dprime
;
dprime : ELSE OFB statlist CFB 
		|
;
loopstat : WHILE OB expn CB OFB statlist CFB 
			| FOR OB asstat SC expn SC asstat CB OFB statlist CFB 											
;
relop : EQQ 
		| NEQU
		| LT 
		| GT
		| G
		| L		
;
addop : PLUS
		| MINUS
;
mulop : MUL 
		| DIV
		| MOD
;
%%
void main()
{
	yyin = fopen("in.txt","r");
	do{
		if(yyparse()){
			exit(0);
		}
	}while(!feof(yyin));
	printf("success\n");     
}