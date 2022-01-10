%{

#include "Utils.h"
int linie=0;

%}

%option noyywrap 
%option yylineno
%option caseless


LITERA		[A-Za-z_]
CIFRA		[0-9]
CIFRA_NENULA	[1-9] 
IDENTIFICATOR	{LITERA}|{LITERA}{LITERA}*{CIFRA}*
NUMAR		{CIFRA_NENULA}{CIFRA}*
SEMN 		[+-]
CONSTANTA	({SEMN}?{CIFRA_NENULA}{CIFRA}*)|0
DELIMIT  	[;.,:]
STRING		["][^\n]*["]
CARACTER	"'"[^'\n]"'"
EROARE_IDENTIFICATOR	{IDENTIFICATOR}+
EROARE_CARACTER	"'"[^'\n]+"'"|"'"['\n]+"'"|"'""'"

%%

[ \t]
[\n] {linie++;}
{CIFRA}+{IDENTIFICATOR} {cout<<"Eroare lexicala - identificator incepe cu cifra "<< yytext<<" la linia "<< yylineno<<endl; return -1;}

PROGRAM	{addFIP(2,-1,fip);cout<<"2 "<<yytext<<endl;}
ARRAY		{addFIP(3,-1,fip);cout<<"3 "<<yytext<<endl;}
OF		{addFIP(4,-1,fip);cout<<"4 "<<yytext<<endl;}
VAR		{addFIP(5,-1,fip);cout<<"5 "<<yytext<<endl;}
INT		{addFIP(6,-1,fip);cout<<"6 "<<yytext<<endl;}
FLOAT		{addFIP(7,-1,fip);cout<<"7 "<<yytext<<endl;}
BOOL		{addFIP(8,-1,fip);cout<<"8 "<<yytext<<endl;}
BEGIN		{addFIP(9,-1,fip);cout<<"9 "<<yytext<<endl;}
END       	{addFIP(10,-1,fip);cout<<"10 "<<yytext<<endl;}
ENDPROGRAM	{addFIP(11,-1,fip);cout<<"11 "<<yytext<<endl;}
READ		{addFIP(12,-1,fip);cout<<"12 "<<yytext<<endl;}
WRITE		{addFIP(13,-1,fip);cout<<"13 "<<yytext<<endl;}
FOR       	{addFIP(14,-1,fip);cout<<"14 "<<yytext<<endl;}
IF          	{addFIP(15,-1,fip);cout<<"15 "<<yytext<<endl;}
THEN         	{addFIP(16,-1,fip);cout<<"16 "<<yytext<<endl;}
ELSE          	{addFIP(17,-1,fip);cout<<"17 "<<yytext<<endl;}
AND          	{addFIP(18,-1,fip);cout<<"18 "<<yytext<<endl;}
OR         	{addFIP(19,-1,fip);cout<<"19 "<<yytext<<endl;}
NOT          	{addFIP(20,-1,fip);cout<<"20 "<<yytext<<endl;}
\:         	{addFIP(21,-1,fip);cout<<"21 "<<yytext<<endl;}   
\;         	{addFIP(22,-1,fip);cout<<"22 "<<yytext<<endl;} 
\,         	{addFIP(23,-1,fip);cout<<"23 "<<yytext<<endl;}
\.         	{addFIP(24,-1,fip);cout<<"24 "<<yytext<<endl;}
\+        	{addFIP(25,-1,fip);cout<<"25 "<<yytext<<endl;}
\*         	{addFIP(26,-1,fip);cout<<"26 "<<yytext<<endl;}
\( 		{addFIP(27,-1,fip);cout<<"27 "<<yytext<<endl;}
\)         	{addFIP(28,-1,fip);cout<<"28 "<<yytext<<endl;}  
\[ 		{addFIP(29,-1,fip);cout<<"29 "<<yytext<<endl;}
\]     	{addFIP(30,-1,fip);cout<<"30 "<<yytext<<endl;}  
\{ 		{addFIP(31,-1,fip);cout<<"31 "<<yytext<<endl;}
\}         	{addFIP(32,-1,fip);cout<<"32 "<<yytext<<endl;}
\- 		{addFIP(33,-1,fip);cout<<"33 "<<yytext<<endl;}
\<         	{addFIP(34,-1,fip);cout<<"34 "<<yytext<<endl;}    
\>         	{addFIP(35,-1,fip);cout<<"35 "<<yytext<<endl;}    
\=         	{addFIP(36,-1,fip);cout<<"36 "<<yytext<<endl;}    
":="    	{addFIP(37,-1,fip);cout<<"37  "<<yytext<<endl;}  
"<="    	{addFIP(38,-1,fip);cout<<"38  "<<yytext<<endl;}  
">="    	{addFIP(39,-1,fip);cout<<"39  "<<yytext<<endl;}

{IDENTIFICATOR}	{string token=(string)(yytext);
                 pozTS=addTS(TS,token);addFIP(0,pozTS,fip); 
				 cout<<"0"<<" "<<yytext<<endl;}
{CONSTANTA}	{
	         string token=(string)(yytext);
			 pozTS=addTS(TS,token);
			 addFIP(1,pozTS,fip);
	         cout<<"1"<<yytext<<endl;
		}

{CARACTER}	{
			string token=(string)(yytext);
			 pozTS=addTS(TS,token);
			 addFIP(1,pozTS,fip);
	         cout<<"1"<<yytext<<endl;		}
{STRING}	{string token=(string)(yytext);
			 pozTS=addTS(TS,token);
			 addFIP(1,pozTS,fip);
	         cout<<"1"<<yytext<<endl;}


{EROARE_IDENTIFICATOR} {cout<<"Eroare lexicala - identificator are cifre in mijloc "<< yytext<<" la linia "<< yylineno<<endl; return -1;}

{EROARE_CARACTER} {cout<<"Eroare lexicala - Prea multe caractere/niciun caracter/caractere incorecte in apostroafe "<< yytext<<" la linia "<< yylineno<<endl; return -1;}

\' {cout<<"Eroare lexicala - apostrof doar deschis "<< yytext<<" la linia "<< yylineno<<endl; return -1;}

\" {cout<<"Eroare lexicala - ghilimea doar deschisa "<< yytext<<" la linia "<< yylineno<<endl; return -1;}

. {cout<<"Eroare lexicala "<< yytext<<" la linia "<< yylineno<<endl; return -1;}

%%

extern FILE *yyin;


int main(int argc, char **argv)
{

	++argv, --argc;
	if (argc>0)
   		yyin=fopen(argv[0],"r");
        int rez= yylex();
	    if(rez!=-1){
		  cout<<"Corect lexical!"<<endl;
          printFIP(fip);
          printTS(TS); 
        }
	return 0;
}


