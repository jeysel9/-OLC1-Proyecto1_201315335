// ------------  Paquete e importaciones ------------
package statPy; 

import java_cup.runtime.*;

%%	
//-------> Directivas (No tocar)

%public 
%class Lexer
%cup
%char
%column
%line
%unicode
%ignorecase

%{ 
%} 

// ------> Expresiones Regulares 

entero = \d+
decimal = \d+(\.\d+)?
cadena = ("\"" [^\n\"]* "\"")
caracter = [\'].[\']
id = [a-zA-Z_][a-zA-Z0-9_]*
blancos = [\t\r\n\f\s]
comentario = "//" [^\n]*
comentarioMulti= "/*"[\s\S]*?"*/"
%%

// ---------------------  Reglas Lexicas -------------------

//------------> EXPRESIONES REGULARES
{entero}  { return new Symbol(sym.ENTERO, yycolumn, yyline, yytext()); }
{decimal}  { return new Symbol(sym.DECIMAL, yycolumn, yyline, yytext()); }
{cadena}  { return new Symbol(sym.CADENA, yycolumn, yyline, yytext()); }
{caracter}  { return new Symbol(sym.CARACTER, yycolumn, yyline, yytext()); }
{id}  { return new Symbol(sym.ID, yycolumn, yyline, yytext()); }


//------------> SENTENCIAS Y RESERVADAS
"if" { return new Symbol(sym.IF, yycolumn, yyline, yytext()); }
"else" { return new Symbol(sym.ELSE, yycolumn, yyline, yytext()); }
"switch" { return new Symbol(sym.SWITCH, yycolumn, yyline, yytext()); }
"case" { return new Symbol(sym.CASE, yycolumn, yyline, yytext()); }
"default" { return new Symbol(sym.DEFAULT, yycolumn, yyline, yytext()); }
"break" { return new Symbol(sym.BREAK, yycolumn, yyline, yytext()); }
"for" { return new Symbol(sym.FOR, yycolumn, yyline, yytext()); }
"while" { return new Symbol(sym.WHILE, yycolumn, yyline, yytext()); }
"do" { return new Symbol(sym.DO, yycolumn, yyline, yytext()); }
"true" { return new Symbol(sym.TRUE, yycolumn, yyline, yytext()); }
"false" { return new Symbol(sym.FALSE, yycolumn, yyline, yytext()); }
"console" { return new Symbol(sym.CONSOLE, yycolumn, yyline, yytext()); }
"write" { return new Symbol(sym.WRITE, yycolumn, yyline, yytext()); }
"main" { return new Symbol(sym.MAIN, yycolumn, yyline, yytext()); }
"void" { return new Symbol(sym.VOID, yycolumn, yyline, yytext()); }
"definirglobales" { return new Symbol(sym.DEFINIRGLOBALES, yycolumn, yyline, yytext()); }
"definirbarras" { return new Symbol(sym.DEFINIRBARRAS, yycolumn, yyline, yytext()); }
"definirpie" { return new Symbol(sym.DEFINIRPIE, yycolumn, yyline, yytext()); }
"titulo" { return new Symbol(sym.TITULO, yycolumn, yyline, yytext()); }
"titulox" { return new Symbol(sym.TITULOX, yycolumn, yyline, yytext()); }
"tituloy" { return new Symbol(sym.TITULOY, yycolumn, yyline, yytext()); }
"valores" { return new Symbol(sym.VALORES, yycolumn, yyline, yytext()); }
"ejex" { return new Symbol(sym.EJEX, yycolumn, yyline, yytext()); }


//------------> TIPO DE DATOS
"int" { return new Symbol(sym.INT, yycolumn, yyline, yytext()); }
"double" { return new Symbol(sym.DOUBLE, yycolumn, yyline, yytext()); }
"char" { return new Symbol(sym.CHAR, yycolumn, yyline, yytext()); }
"bool" { return new Symbol(sym.BOOL, yycolumn, yyline, yytext()); }
"string" { return new Symbol(sym.STRING, yycolumn, yyline, yytext()); }

//---------------------- SIMBOLOS ----------------------------
//------------> ARITMETICOS
"+" { return new Symbol(sym.SUMA, yycolumn, yyline, yytext()); }
"-" { return new Symbol(sym.RESTA, yycolumn, yyline, yytext()); }
"*" { return new Symbol(sym.MULTIPLICACION, yycolumn, yyline, yytext()); }
"/" { return new Symbol(sym.DIVISION, yycolumn, yyline, yytext()); }
"=" { return new Symbol(sym.IGUAL, yycolumn, yyline, yytext()); }

//------------> RELACIONALES
"<" { return new Symbol(sym.MENOR, yycolumn, yyline, yytext()); }
">" { return new Symbol(sym.MAYOR, yycolumn, yyline, yytext()); }
"<=" { return new Symbol(sym.MENORIGUAL, yycolumn, yyline, yytext()); }
">=" { return new Symbol(sym.MAYORIGUAL, yycolumn, yyline, yytext()); }
"==" { return new Symbol(sym.IGUALIGUAL, yycolumn, yyline, yytext()); }
"!=" { return new Symbol(sym.DIFERENTE, yycolumn, yyline, yytext()); }

//------------> LOGICOS
"&&" { return new Symbol(sym.AND, yycolumn, yyline, yytext()); }
"||" { return new Symbol(sym.OR, yycolumn, yyline, yytext()); }
"!" { return new Symbol(sym.NOT, yycolumn, yyline, yytext()); }


//------------> AGRUPACION
"{" { return new Symbol(sym.LLAVEABIERTA, yycolumn, yyline, yytext()); }
"}" { return new Symbol(sym.LLAVECERRADA, yycolumn, yyline, yytext()); }
"(" { return new Symbol(sym.PARENTESISABIERTO, yycolumn, yyline, yytext()); }
")" { return new Symbol(sym.PARENTESISCERRADO, yycolumn, yyline, yytext()); }
"[" { return new Symbol(sym.CORCHETEABIERTO, yycolumn, yyline, yytext()); }
"]" { return new Symbol(sym.CORCHETECERRADO, yycolumn, yyline, yytext()); }


//------------> OTROS
"." { return new Symbol(sym.PUNTO, yycolumn, yyline, yytext()); }
"," { return new Symbol(sym.COMA, yycolumn, yyline, yytext()); }
":" { return new Symbol(sym.DOSPUNTOS, yycolumn, yyline, yytext()); }
";" { return new Symbol(sym.PUNTOCOMA, yycolumn, yyline, yytext()); }
"$" { return new Symbol(sym.DOLAR, yycolumn, yyline, yytext()); }

//-------------------- Ingorados ------------------------
{blancos}    {/*  se ignoran */}
{comentario}    {/*  se ignoran */}
{comentarioMulti}    {/*  se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }