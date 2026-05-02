# 🧟 No More Room in Hell 2 - Ultimate Optimizer (UE5)

![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)
![Unreal Engine 5](https://img.shields.io/badge/Engine-UE5-white.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

Una herramienta avanzada con Interfaz Gráfica (GUI) escrita en PowerShell para solucionar los problemas críticos de rendimiento y *stuttering* en **No More Room in Hell 2**. 

El motor Unreal Engine 5 en este juego tiende a desbordar la memoria de video (pidiendo hasta 10GB+), lo que asfixia a tarjetas gráficas de 8GB como la **Radeon RX 6600** o la **RTX 3060**, forzando al sistema a usar la memoria RAM lenta y reduciendo los fotogramas a 25-30 FPS. Este script reescribe las reglas del motor para mantener el juego estrictamente dentro de tus límites físicos.

## ✨ Características Principales

*   **Control Estricto de VRAM:** Limita el *PoolSize* a 3.5GB (`3500`) y bloquea el uso de texturas fuera de la VRAM física, eliminando los tirones constantes.
*   **Selector de Compresión (MipMapLODBias):** Permite reducir matemáticamente la resolución base de las texturas. Desde un nivel "Ligero" para ahorrar VRAM sin perder calidad visual, hasta un "Modo Patata" de emergencia.
*   **Hacks de Estabilidad del Motor:**
    *   Optimiza el sistema de *Garbage Collection* para evitar micro-cortes al cargar nuevas zonas del mapa.
    *   Bloquea el envío de datos de telemetría y logs en segundo plano para liberar ciclos del procesador.
*   **Optimización Específica RDNA2 (AMD):** Fuerza la computación asíncrona (`AsyncCompute`) para sacar ventaja de la arquitectura paralela de las gráficas Radeon.
*   **Inyección Segura:** El script usa un sistema inteligente de búsqueda y reemplazo que **no duplica líneas de código**, manteniendo el archivo `Engine.ini` limpio por muchas veces que presiones aplicar. Incluye generación automática de backups.

## 🚀 Instalación y Uso

1. Descarga el archivo `NMRiH2_Optimizer_V5.1.ps1` de este repositorio.
2. Abre **PowerShell como Administrador**.
3. Navega a la carpeta de descarga o arrastra el archivo `.ps1` a la ventana y presiona `Enter`.
4. En la interfaz gráfica:
   * Selecciona tu nivel de compresión de texturas (Recomendado: `1 - Ligera`).
   * Marca las casillas de optimización que desees.
   * Haz clic en **APLICAR OPTIMIZACION V5.1**.
5. Cierra la herramienta.

## ⚙️ Paso Final Obligatorio (Steam)

Para que la optimización esté completa y obligar al juego a usar tu procesador al máximo:
1. Abre Steam y ve a tu Biblioteca.
2. Haz clic derecho en **No More Room in Hell 2** > **Propiedades**.
3. En la pestaña "General", baja hasta **Parámetros de lanzamiento**.
4. Pega exactamente esta línea:
   ```text
   -USEALLAVAILABLECORES -high -NoVerifyGC
