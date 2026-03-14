# 🤖 Reto Final – Control de Brazo Robótico con FPGA

## 📌 Descripción

Este proyecto consiste en el diseño e implementación de un sistema de control para un **brazo robótico de múltiples grados de libertad** utilizando una **FPGA DE10-Lite**.

La FPGA funciona como **unidad de control principal**, utilizando el **acelerómetro integrado** como interfaz de mando.  
Las lecturas del acelerómetro se procesan y se convierten en **señales PWM** para controlar los servomotores del brazo robótico.

El sistema también incluye un **módulo VGA** para visualizar en tiempo real los **ángulos del brazo**, además de **modos de operación manual y automático**.

---

# 🎯 Objetivos del Proyecto

Desarrollar un sistema capaz de:

- Controlar un **brazo robótico de al menos 3 grados de libertad**
- Utilizar el **acelerómetro de la FPGA como controlador**
- Convertir lecturas del sensor en **señales PWM para servos**
- Visualizar **ángulos en tiempo real mediante VGA**
- Implementar **modo manual y automático**
- Guardar **hasta 8 posiciones en memoria**
- Controlar una **garra mediante un cuarto servo**
- Mostrar información en **displays y LEDs de la FPGA**

---

# 🛠 Hardware Utilizado

- FPGA **DE10-Lite (Intel MAX10)**
- Sensor **Acelerómetro ADXL345**
- **Servomotores (4)**
  - Base
  - Brazo
  - Antebrazo
  - Garra
- Monitor **VGA**
- Fuente de alimentación externa para servos

---

# 💻 Software y Herramientas

- **Intel Quartus Prime Lite**
- **Verilog HDL**
- Simulación con **ModelSim**
- Programación mediante **USB Blaster**

---

# 🧠 Arquitectura del Sistema

El sistema está compuesto por varios módulos que trabajan en conjunto.

```
             ┌─────────────────┐
             │  Acelerómetro   │
             │   ADXL345 SPI   │
             └────────┬────────┘
                      │
                      ▼
              ┌───────────────┐
              │ Procesamiento │
              │   de datos    │
              └───────┬───────┘
                      │
                      ▼
              ┌───────────────┐
              │  Conversión   │
              │  Ángulo → PWM │
              └───────┬───────┘
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
    Servo 1       Servo 2       Servo 3
   (Base)        (Brazo)       (Codo)

                      │
                      ▼
                Servo 4
                 (Garra)

        ┌─────────────────────────┐
        │ Visualización VGA       │
        │ Ángulos en tiempo real  │
        └─────────────────────────┘

        ┌─────────────────────────┐
        │ Displays y LEDs FPGA    │
        │ Coordenadas / estados   │
        └─────────────────────────┘
```

---

# 🎮 Modos de Operación

## 🔹 Modo Manual

En este modo el brazo se controla **directamente con el acelerómetro**.

- Al inclinar la FPGA se modifican los ángulos del brazo
- Los valores del acelerómetro se convierten en **ángulos**
- Los ángulos se transforman en **PWM para cada servo**

Esto permite utilizar la FPGA como **controlador de movimiento del brazo**.

---

## 🔹 Modo Automático

El sistema permite **guardar hasta 8 posiciones diferentes del brazo**.

Estas posiciones se almacenan en una **memoria interna** dentro de la FPGA.

Cuando se activa el modo automático:

1. El sistema recorre las posiciones guardadas
2. Cada posición se reproduce en secuencia
3. El brazo ejecuta el movimiento programado

Esto permite crear **secuencias de movimiento automáticas**.

---

# 🦾 Control de Servomotores

El brazo utiliza **4 servos controlados por PWM**:

| Servo | Función |
|------|--------|
| Servo 1 | Rotación de la base |
| Servo 2 | Movimiento del brazo |
| Servo 3 | Movimiento del antebrazo |
| Servo 4 | Apertura y cierre de la garra |

La señal PWM se genera a partir de la conversión de **ángulos calculados desde el acelerómetro**.

---

# 🖥 Visualización VGA

El sistema incluye un módulo **VGA** que permite visualizar:

- ángulos de cada articulación
- estado del sistema
- modo de operación

Esto permite monitorear el comportamiento del brazo **en tiempo real**.

---

# 📟 Displays y LEDs

La FPGA también utiliza sus periféricos integrados para mostrar información:

### Displays de 7 segmentos
- coordenadas o ángulos del brazo
- estado del sistema

### LEDs
- indicadores de estado
- datos del sensor
- modo de operación

---

# 📂 Estructura del Proyecto

```
Reto_Brazo_Robotico/
│
├── accel_controller.v
├── pwm_generator.v
├── servo_controller.v
├── memory_positions.v
├── vga_display.v
│
├── imagenes
│   ├── brazo_robotico.jpg
│   ├── sistema_fpga.jpg
│   └── vga_visualizacion.jpg
│
└── README.md
```

---

# 📷 Evidencias

## Brazo robótico controlado por FPGA

![Brazo Robotico](imagenes/brazo_robotico.jpg)

---

## Visualización del Proyecto

https://drive.google.com/file/d/1EIxWVR7jxFPT9iA_LXzwg4iYGDzH1S9N/view?usp=drive_link
---

# 🚀 Resultados

Se logró implementar un sistema completo capaz de:

- controlar un **brazo robótico de 3+ grados de libertad**
- utilizar la **FPGA como controlador de movimiento**
- convertir **datos del acelerómetro en señales PWM**
- visualizar información en **VGA**
- almacenar **posiciones en memoria**
- ejecutar **secuencias automáticas**

El proyecto integra múltiples conceptos de diseño digital y sistemas embebidos en FPGA.

---

# 👨‍💻 Autores

-Ángeles Araiza
-Vannesa Salazar
-Ana Chavez

Proyecto final de **Diseño Digital con FPGA – Verilog HDL**

Implementado en **Intel DE10-Lite FPGA**.
