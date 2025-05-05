/* Archivo: Lexer_Java.flex - Versión Completa */
package Analizador_Lexico;

%%

%class Lexer_Java
%public
%unicode
%line
%column
%type Token

%{
  // Código que se incluirá en la clase generada
  private StringBuffer string = new StringBuffer();
  
  // Método para crear tokens
  private Token token(String tipo) {
    return new Token(tipo, yytext(), yyline+1, yycolumn+1);
  }
  
  private Token token(String tipo, Object valor) {
    return new Token(tipo, valor, yyline+1, yycolumn+1);
  }
%}

/* Definición de estados */
%state STRING
%state CHAR
%state COMMENT
%state LINE_COMMENT

/* Macros (abreviaturas para expresiones regulares) */
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

/* Identificadores y nombres */
Identifier     = [a-zA-Z_][a-zA-Z0-9_]*

/* Literales numéricos */
DecIntLiteral  = 0 | [1-9][0-9]*
OctIntLiteral  = 0[0-7]+
HexIntLiteral  = 0[xX][0-9a-fA-F]+
BinIntLiteral  = 0[bB][01]+

DecIntegerLiteral = {DecIntLiteral} [lL]?
OctIntegerLiteral = {OctIntLiteral} [lL]?
HexIntegerLiteral = {HexIntLiteral} [lL]?
BinIntegerLiteral = {BinIntLiteral} [lL]?

IntegerLiteral = {DecIntegerLiteral} | {OctIntegerLiteral} | {HexIntegerLiteral} | {BinIntegerLiteral}

ExponentPart   = [eE] [+-]? [0-9]+

FloatLiteral   = [0-9]+ \. [0-9]* {ExponentPart}? [fFdD]?
               | \. [0-9]+ {ExponentPart}? [fFdD]?
               | [0-9]+ {ExponentPart} [fFdD]?
               | [0-9]+ {ExponentPart}? [fFdD]

/* Literales de cadenas y caracteres */
StringCharacter = [^\r\n\"\\]
CharCharacter   = [^\r\n\'\\]
BackslashSeq    = \\ [btnfr\"\'\\] | \\ [0-3]? [0-7]{1,2}

/* Comentarios */
InputCharacter = [^\r\n]

%%
/* Reglas léxicas */

/* Palabras clave */
"abstract"     { return token("PALABRA_CLAVE"); }
"assert"       { return token("PALABRA_CLAVE"); }
"boolean"      { return token("TIPO"); }
"break"        { return token("PALABRA_CLAVE"); }
"byte"         { return token("TIPO"); }
"case"         { return token("PALABRA_CLAVE"); }
"catch"        { return token("PALABRA_CLAVE"); }
"char"         { return token("TIPO"); }
"class"        { return token("PALABRA_CLAVE"); }
"const"        { return token("PALABRA_CLAVE"); }
"continue"     { return token("PALABRA_CLAVE"); }
"default"      { return token("PALABRA_CLAVE"); }
"do"           { return token("PALABRA_CLAVE"); }
"double"       { return token("TIPO"); }
"else"         { return token("PALABRA_CLAVE"); }
"enum"         { return token("PALABRA_CLAVE"); }
"extends"      { return token("PALABRA_CLAVE"); }
"final"        { return token("PALABRA_CLAVE"); }
"finally"      { return token("PALABRA_CLAVE"); }
"float"        { return token("TIPO"); }
"for"          { return token("PALABRA_CLAVE"); }
"goto"         { return token("PALABRA_CLAVE"); }
"if"           { return token("PALABRA_CLAVE"); }
"implements"   { return token("PALABRA_CLAVE"); }
"import"       { return token("PALABRA_CLAVE"); }
"instanceof"   { return token("OPERADOR"); }
"int"          { return token("TIPO"); }
"interface"    { return token("PALABRA_CLAVE"); }
"long"         { return token("TIPO"); }
"native"       { return token("PALABRA_CLAVE"); }
"new"          { return token("PALABRA_CLAVE"); }
"package"      { return token("PALABRA_CLAVE"); }
"private"      { return token("PALABRA_CLAVE"); }
"protected"    { return token("PALABRA_CLAVE"); }
"public"       { return token("PALABRA_CLAVE"); }
"return"       { return token("PALABRA_CLAVE"); }
"short"        { return token("TIPO"); }
"static"       { return token("PALABRA_CLAVE"); }
"strictfp"     { return token("PALABRA_CLAVE"); }
"super"        { return token("PALABRA_CLAVE"); }
"switch"       { return token("PALABRA_CLAVE"); }
"synchronized" { return token("PALABRA_CLAVE"); }
"this"         { return token("PALABRA_CLAVE"); }
"throw"        { return token("PALABRA_CLAVE"); }
"throws"       { return token("PALABRA_CLAVE"); }
"transient"    { return token("PALABRA_CLAVE"); }
"try"          { return token("PALABRA_CLAVE"); }
"void"         { return token("TIPO"); }
"volatile"     { return token("PALABRA_CLAVE"); }
"while"        { return token("PALABRA_CLAVE"); }
"_"            { return token("PALABRA_CLAVE"); } /* Desde Java 9, '_' es palabra reservada */

/* Valores booleanos y null */
"true"         { return token("VALOR_BOOL", true); }
"false"        { return token("VALOR_BOOL", false); }
"null"         { return token("VALOR_NULL", null); }

/* Operadores */
"+"            { return token("OPERADOR"); }
"-"            { return token("OPERADOR"); }
"*"            { return token("OPERADOR"); }
"/"            { return token("OPERADOR"); }
"%"            { return token("OPERADOR"); }
"++"           { return token("OPERADOR"); }
"--"           { return token("OPERADOR"); }
"=="           { return token("OPERADOR"); }
"!="           { return token("OPERADOR"); }
"<"            { return token("OPERADOR"); }
">"            { return token("OPERADOR"); }
"<="           { return token("OPERADOR"); }
">="           { return token("OPERADOR"); }
"&&"           { return token("OPERADOR"); }
"||"           { return token("OPERADOR"); }
"!"            { return token("OPERADOR"); }
"&"            { return token("OPERADOR"); }
"|"            { return token("OPERADOR"); }
"^"            { return token("OPERADOR"); }
"~"            { return token("OPERADOR"); }
"<<"           { return token("OPERADOR"); }
">>"           { return token("OPERADOR"); }
">>>"          { return token("OPERADOR"); }
"="            { return token("OPERADOR"); }
"+="           { return token("OPERADOR"); }
"-="           { return token("OPERADOR"); }
"*="           { return token("OPERADOR"); }
"/="           { return token("OPERADOR"); }
"%="           { return token("OPERADOR"); }
"&="           { return token("OPERADOR"); }
"|="           { return token("OPERADOR"); }
"^="           { return token("OPERADOR"); }
"<<="          { return token("OPERADOR"); }
">>="          { return token("OPERADOR"); }
">>>="         { return token("OPERADOR"); }
"->"           { return token("OPERADOR"); } /* Operador lambda */
"::"           { return token("OPERADOR"); } /* Referencia a método */

/* Delimitadores */
"("            { return token("DELIMITADOR"); }
")"            { return token("DELIMITADOR"); }
"{"            { return token("DELIMITADOR"); }
"}"            { return token("DELIMITADOR"); }
"["            { return token("DELIMITADOR"); }
"]"            { return token("DELIMITADOR"); }
";"            { return token("DELIMITADOR"); }
","            { return token("DELIMITADOR"); }
"."            { return token("DELIMITADOR"); }
":"            { return token("DELIMITADOR"); }
"?"            { return token("DELIMITADOR"); }
"..."          { return token("DELIMITADOR"); } /* Operador varargs */
"@"            { return token("ANOTACION"); } /* Prefijo de anotaciones */

/* Comentarios */
"//"                      { yybegin(LINE_COMMENT); }
<LINE_COMMENT> {
  {LineTerminator}        { yybegin(YYINITIAL); }
  .                       { /* ignorar */ }
}

"/*"                      { yybegin(COMMENT); }
<COMMENT> {
  "*/"                    { yybegin(YYINITIAL); }
  [^*\n]+                 { /* ignorar */ }
  "*"                     { /* ignorar */ }
  {LineTerminator}        { /* ignorar */ }
}

/* Literales numéricos */
{IntegerLiteral}    { 
    if (yytext().endsWith("l") || yytext().endsWith("L")) {
        // Es un entero largo
        String valor = yytext().substring(0, yytext().length() - 1);
        if (yytext().startsWith("0x") || yytext().startsWith("0X")) {
            // Hexadecimal
            return token("ENTERO_LONG", Long.parseLong(valor.substring(2), 16));
        } else if (yytext().startsWith("0b") || yytext().startsWith("0B")) {
            // Binario
            return token("ENTERO_LONG", Long.parseLong(valor.substring(2), 2));
        } else if (valor.length() > 1 && valor.startsWith("0")) {
            // Octal
            return token("ENTERO_LONG", Long.parseLong(valor, 8));
        } else {
            // Decimal
            return token("ENTERO_LONG", Long.parseLong(valor));
        }
    } else {
        // Es un entero normal
        if (yytext().startsWith("0x") || yytext().startsWith("0X")) {
            // Hexadecimal
            return token("ENTERO_HEX", Integer.parseInt(yytext().substring(2), 16));
        } else if (yytext().startsWith("0b") || yytext().startsWith("0B")) {
            // Binario
            return token("ENTERO_BIN", Integer.parseInt(yytext().substring(2), 2));
        } else if (yytext().length() > 1 && yytext().startsWith("0")) {
            // Octal
            return token("ENTERO_OCT", Integer.parseInt(yytext(), 8));
        } else {
            // Decimal
            return token("ENTERO", Integer.parseInt(yytext()));
        }
    }
}

{FloatLiteral}  { 
    if (yytext().endsWith("f") || yytext().endsWith("F")) {
        // Es un float
        String valor = yytext().substring(0, yytext().length() - 1);
        return token("FLOTANTE", Float.parseFloat(valor));
    } else if (yytext().endsWith("d") || yytext().endsWith("D")) {
        // Es un double explícito
        String valor = yytext().substring(0, yytext().length() - 1);
        return token("DOUBLE", Double.parseDouble(valor));
    } else {
        // Es un double por defecto
        return token("DOUBLE", Double.parseDouble(yytext()));
    }
}

/* Literales de caracteres */
\'              { string.setLength(0); yybegin(CHAR); }
<CHAR> {
  \'            { yybegin(YYINITIAL); 
                 return token("CARACTER", string.length() > 0 ? string.charAt(0) : '\0'); }
  {CharCharacter} { string.append(yytext()); }
  {BackslashSeq} { 
                 char c = yytext().charAt(1);
                 switch(c) {
                     case 'b': string.append('\b'); break;
                     case 't': string.append('\t'); break;
                     case 'n': string.append('\n'); break;
                     case 'f': string.append('\f'); break;
                     case 'r': string.append('\r'); break;
                     case '\"': string.append('\"'); break;
                     case '\'': string.append('\''); break;
                     case '\\': string.append('\\'); break;
                     default: string.append(c);
                 }
                }
  {LineTerminator} { throw new RuntimeException("Carácter sin cerrar"); }
}

/* Literales de cadenas */
\"              { string.setLength(0); yybegin(STRING); }
<STRING> {
  \"            { yybegin(YYINITIAL); 
                 return token("CADENA", string.toString()); }
  {StringCharacter}+ { string.append(yytext()); }
  {BackslashSeq} { 
                 char c = yytext().charAt(1);
                 switch(c) {
                     case 'b': string.append('\b'); break;
                     case 't': string.append('\t'); break;
                     case 'n': string.append('\n'); break;
                     case 'f': string.append('\f'); break;
                     case 'r': string.append('\r'); break;
                     case '\"': string.append('\"'); break;
                     case '\'': string.append('\''); break;
                     case '\\': string.append('\\'); break;
                     default: string.append(c);
                 }
                }
  {LineTerminator} { throw new RuntimeException("Cadena sin cerrar"); }
}

/* Identificadores: después de palabras clave para no interferir */
"String"       { return token("TIPO"); } /* Tipo especial */
{Identifier}   { return token("IDENTIFICADOR"); }

/* Espacios en blanco */
{WhiteSpace}   { /* ignorar */ }

/* Error */
.              { return token("ERROR", "Carácter ilegal <" + yytext() + ">"); }