// CMSC 430 Compiler Theory and Design
// Project 1 - Philip M. Seisman
// UMGC CITE

/* This file contains flex input file */

%{
#include <cstdio>
#include <string>
using namespace std;
#include "listing.h"
#include "tokens.h"
%}

%option noyywrap

ws      [ \t\r]+
comment "//".*\n
new_comment "--".*\n
line    [\n]
id      [A-Za-z]([A-Za-z0-9]|(_{1,2}[A-Za-z0-9]))*
digit   [0-9]
hex     \#[0-9A-Fa-f]+
dec     {digit}+
float		{digit}*"."{digit}+([Ee][+-]?{digit}+)?
char		'.'|'\\[btnrf]'
punc    [\(\),:;]

%%

{ws}            { ECHO; }
{comment}       { ECHO; nextLine(); }
{new_comment}   { ECHO; nextLine(); }
{line}          { ECHO; nextLine(); }
"+"             { ECHO; return(ADDOP); }
"-"             { ECHO; return(ADDOP); }
"*"             { ECHO; return(MULOP); }
"/"             { ECHO; return(MULOP); }
"&"             { ECHO; return(ANDOP); }
"<"             { ECHO; return(RELOP); }
"=>"            { ECHO; return(ARROW); }
"|"             { ECHO; return(OROP); }
"!"             { ECHO; return(NOTOP); }
"="             { ECHO; return(RELOP); }
"<>"            { ECHO; return(RELOP); }
">"             { ECHO; return(RELOP); }
">="            { ECHO; return(RELOP); }
"<="            { ECHO; return(RELOP); }
"%"             { ECHO; return(REMOP); }
"^"             { ECHO; return(EXPOP); }
"~"             { ECHO; return(NEGOP); }
{float}         { ECHO; return(REAL_LITERAL); }
{hex}           { ECHO; return(INT_LITERAL); }
{char}          { ECHO; return(CHAR_LITERAL); }
begin		        { ECHO; return(BEGIN_); }
case		        { ECHO; return(CASE); }
character	      { ECHO; return(CHARACTER); }
else		        { ECHO; return(ELSE); }
elsif		        { ECHO; return(ELSIF); }
end		          { ECHO; return(END); }
endfold		      { ECHO; return(ENDFOLD); }
endif		        { ECHO; return(ENDIF); }
endswitch	      { ECHO; return(ENDSWITCH); }
fold		        { ECHO; return(FOLD); }
function	      { ECHO; return(FUNCTION); }
if		          { ECHO; return(IF); }
integer		      { ECHO; return(INTEGER); }
is		          { ECHO; return(IS); }
left		        { ECHO; return(LEFT); }
list		        { ECHO; return(LIST); }
of		          { ECHO; return(OF); }
others		      { ECHO; return(OTHERS); }
real		        { ECHO; return(REAL); }
returns		      { ECHO; return(RETURNS); }
right		        { ECHO; return(RIGHT); }
switch		      { ECHO; return(SWITCH); }
then		        { ECHO; return(THEN); }
when		        { ECHO; return(WHEN); }
{id}            { ECHO; return(IDENTIFIER); }
{dec}           { ECHO; return(INT_LITERAL); }
{punc}          { ECHO; return(yytext[0]); }
.               { ECHO; appendError(LEXICAL, yytext); }

%%

int main() {
	firstLine();
	
	FILE *file = fopen("lexemes.txt", "wa"); 
	int token = yylex();
	while (token) {
		fprintf(file, "%d %s\n", token, yytext);
		token = yylex();
	}
	lastLine();
	fclose(file);
	return 0;
}
