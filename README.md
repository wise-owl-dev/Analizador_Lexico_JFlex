# Analizador Léxico con JFlex

Este proyecto implementa un analizador léxico utilizando JFlex, una herramienta para generar analizadores léxicos en Java. El analizador es capaz de reconocer tokens en código fuente y clasificarlos según las reglas definidas.

## 📋 Descripción

El Analizador Léxico es la primera fase de un compilador, encargado de leer el código fuente carácter por carácter y agruparlos en secuencias significativas llamadas tokens. Este proyecto utiliza JFlex para definir las reglas que permiten identificar diferentes tipos de tokens como identificadores, números, operadores y palabras reservadas.

## 🚀 Características

- Reconocimiento de diferentes tipos de tokens:
  - Palabras reservadas
  - Identificadores
  - Números (enteros y decimales)
  - Operadores aritméticos
  - Operadores lógicos
  - Delimitadores
  - Comentarios
- Generación de tabla de símbolos
- Manejo de errores léxicos
- Interfaz gráfica para análisis de archivos

## 🔧 Requisitos previos

- Java JDK 8 o superior
- JFlex 1.8.2 o superior

## 📥 Instalación

### Usando Visual Studio Code

1. Clone o descargue este repositorio
2. Abra la carpeta del proyecto en Visual Studio Code
3. Asegúrese de tener instalada la extensión "Extension Pack for Java"
4. Abra la clase `AnalizadorLexicoGUI.java`
5. Haga clic en el botón "Run" (▶️) que aparece en la parte superior derecha del editor
   
Alternativamente, puede usar el terminal integrado de VS Code:
   ```

6. Generar el analizador léxico desde la especificación JFlex, en este caso indicando la carpeta en la que ubique el programa:
   ```bash
   jflex -d src/ lexer/lexical.flex
   ```

## 🖥️ Uso

1. Seleccione el tipo de análisis que desea realizar (Robot o Java) en el menú desplegable.
2. Ingrese el código a analizar en el área de texto o cargue un ejemplo usando los botones disponibles.
3. Haga clic en el botón "Analizar" para procesar el código.
4. Revise los resultados en las tablas de tokens y símbolos.
5. Use el botón "Limpiar" para borrar todo y comenzar un nuevo análisis.

## 🛠️ Entorno de Desarrollo

Este proyecto ha sido desarrollado y probado en Visual Studio Code con las siguientes configuraciones:

- Visual Studio Code
- Extension Pack for Java que incluye:
  - Language Support for Java
  - Debugger for Java
  - Test Runner for Java
  - Maven for Java
  - Project Manager for Java
  - Visual Studio IntelliCode

---

## 📚 Documentación adicional

- [Manual de JFlex](https://jflex.de/manual.html)
- [Documentación de Java](https://docs.oracle.com/en/java/)

## 👨‍💻 Autores

- Delgado Molina Karla Rocío
- Martínez Martínez Jesús Alexander
- Roque Hernández Diego Misael
