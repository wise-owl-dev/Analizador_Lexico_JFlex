/* Archivo: Lexer_Robot.flex - Versión Mejorada */

package src.main.java.Analizador_Lexico;

%%

%class Lexer_Robot
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
  
  // Variable para seguir el contexto
  private boolean enPrimeraLinea = true;
  private boolean despuesDePunto = false;
%}

/* Definición de estados */
%state AFTER_DOT

/* Macros (abreviaturas para expresiones regulares) */
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
Identifier     = [a-zA-Z][a-zA-Z0-9_]*
IntLiteral     = 0 | [1-9][0-9]*
FloatLiteral   = [0-9]+ \. [0-9]* | \. [0-9]+

%%
/* Reglas léxicas */

{LineTerminator} { 
    enPrimeraLinea = false; 
    despuesDePunto = false;
}

/* Palabra clave Robot (solo al inicio) */
^"Robot" { 
    enPrimeraLinea = false;
    return token("PALABRA_R"); 
}

/* Separador punto y su contexto */
"." { 
    despuesDePunto = true;
    return token("PUNTO"); 
}

/* Acciones específicas (solo después de punto) */
"iniciar"     { return token("ACCION"); }
"finalizar"   { return token("ACCION"); }
"cerrarGarra" { return token("ACCION"); }
"abrirGarra"  { return token("ACCION"); }

/* Acciones específicas (solo después de punto) */
"iniciar"/\(     { return token("ACCION"); }
"finalizar"/\(   { return token("ACCION"); }
"cerrarGarra"/\( { return token("ACCION"); }
"abrirGarra"/\(  { return token("ACCION"); }

/* Métodos específicos para propiedades (solo después de punto) */
"velocidad"/=    { return token("METODO"); }
"base"/=         { return token("METODO"); }
"cuerpo"/=       { return token("METODO"); }
"garra"/=        { return token("METODO"); }

/* Operadores */
"="            { return token("IGUAL"); }
"+"            { return token("OPERADOR"); }
"-"            { return token("OPERADOR"); }
"*"            { return token("OPERADOR"); }
"/"            { return token("OPERADOR"); }

/* Delimitadores */
"("            { return token("PARENTESIS_IZQ"); }
")"            { return token("PARENTESIS_DER"); }
"{"            { return token("LLAVE_IZQ"); }
"}"            { return token("LLAVE_DER"); }
";"            { return token("DELIMITADOR"); }
","            { return token("DELIMITADOR"); }

/* Literales */
{IntLiteral}   { return token("NUMERO", Integer.parseInt(yytext())); }
{FloatLiteral} { return token("NUMERO", Float.parseFloat(yytext())); }

/* Identificadores */
{Identifier}   { 
    if (despuesDePunto) {
        // Si estamos después de un punto y no coincide con acciones/métodos específicos
        if (yytext().equals("iniciar") || yytext().equals("finalizar") || 
            yytext().equals("cerrarGarra") || yytext().equals("abrirGarra")) {
            return token("ACCION");
        } else if (yytext().equals("velocidad") || yytext().equals("base") || 
                  yytext().equals("cuerpo") || yytext().equals("garra")) {
            return token("METODO");
        } else {
            return token("DESCONOCIDO");
        }
    } else {
        return token("IDENTIFICADOR");
    }
}

/* Espacios en blanco */
{WhiteSpace}   { /* ignorar */ }

/* Error */
.              { return token("DESCONOCIDO", "Carácter ilegal <" + yytext() + ">"); }