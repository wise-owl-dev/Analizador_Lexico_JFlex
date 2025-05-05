
package src.main.java.Analizador_Lexico;

/**
 * Clase que representa un token en el análisis léxico
 */
public class Token {
    private final String tipo;
    private final Object valor;
    private final int linea;
    private final int columna;

    public Token(String tipo, Object valor, int linea, int columna) {
        this.tipo = tipo;
        this.valor = valor;
        this.linea = linea;
        this.columna = columna;
    }

    public String getTipo() {
        return tipo;
    }

    public Object getValor() {
        return valor;
    }

    public int getLinea() {
        return linea;
    }

    public int getColumna() {
        return columna;
    }

    @Override
    public String toString() {
        return "Token(" + tipo + ", \"" + valor + "\", " + linea + ", " + columna + ")";
    }
}