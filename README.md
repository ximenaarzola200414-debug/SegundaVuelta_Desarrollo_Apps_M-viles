# Proyecto de Prácticas de Desarrollo Móvil (Flutter)

Este proyecto es una colección de prácticas y módulos desarrollados en Flutter, diseñados para demostrar conceptos fundamentales y avanzados del desarrollo de aplicaciones móviles. El proyecto sigue una estructura modular para separar las diferentes funcionalidades y ejercicios.

## Estructura del Proyecto

El código fuente se encuentra en el directorio `lib/`, organizado principalmente en:

*   `lib/main.dart`: Punto de entrada de la aplicación y configuración de rutas.
*   `lib/screens/`: Contiene todas las pantallas visuales de la aplicación.
    *   `hub_screen.dart`: Pantalla principal de navegación (Hub) que conecta a todas las secciones.
    *   `practices/`: Directorio que contiene las prácticas individuales.
    *   `project/`: Directorio que contiene los módulos del proyecto integrador.

## Contenido del Proyecto

### Prácticas
Las prácticas son ejercicios progresivos para aprender Flutter:

1.  **Práctica 1: Hola Mundo (`practice_1_hello.dart`)**
    *   Una introducción simple que muestra interacciones básicas con widgets y texto.
2.  **Práctica 2: Contador (`practice_2_counter.dart`)**
    *   Implementación clásica de un contador para aprender sobre el manejo de estado (`setState`).
3.  **Práctica 3: Navegación Acumulativa (`practice_3_pageview.dart`)**
    *   Un contenedor visual (`PageView`) que integra las Prácticas 1 y 2, y permite la navegación fluida entre ellas y prácticas posteriores (4 y 5) de manera acumulativa.
4.  **Práctica 4: Formularios (`practice_4_form.dart`)**
    *   Manejo de entradas de usuario, validación de formularios y procesamiento de datos.
5.  **Práctica 5: Piedra, Papel o Tijera (`practice_5_rps_game.dart`)**
    *   Un juego interactivo completo con lógica de negocio, manejo de imágenes y resultados aleatorios.

### Módulos del Proyecto Integrador
Funcionalidades más complejas que simulan aplicaciones reales:

*   **Calculadora IMC (`module_bmi.dart`)**:
    *   Herramienta para calcular el Índice de Masa Corporal.
    *   Entrada de peso y altura.
    *   Cálculo y clasificación de resultados.
*   **Galería Offline (`module_gallery.dart`)**:
    *   Visualizador de imágenes almacenadas localmente en la aplicación (assets), sin necesidad de internet.
*   **Bloc de Notas (`module_notes.dart`)**:
    *   Aplicación para crear y guardar notas de texto simples.
*   **Juego de Paridad (`module_parity_game.dart`)**:
    *   Un juego de lógica matemática para determinar si un número es par o impar.

## Requisitos y Configuración

Este proyecto utiliza **Flutter** y **Dart**.

*   **SDK de Dart**: `^3.10.4`
*   **Flutter Lint**: `^6.0.0` (para asegurar calidad de código)

### Instalación

1.  **Clonar el repositorio**:
    ```bash
    git clone <URL_DEL_REPOSITORIO>
    cd segunda_vuelta_xag
    ```

2.  **Instalar dependencias**:
    Asegúrate de tener Flutter instalado y ejecuta:
    ```bash
    flutter pub get
    ```

3.  **Ejecutar la aplicación**:
    Conecta un dispositivo o inicia un emulador y corre:
    ```bash
    flutter run
    ```

## Recursos
Las imágenes y fuentes utilizadas se encuentran en el directorio `assets/`
