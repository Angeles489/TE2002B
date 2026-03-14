## 🧠 Diseño con lógica programable. 
# Compendio de prácticas en FPGA

Repositorio que contiene una colección de **prácticas de diseño digital utilizando Verilog HDL** implementadas en la **FPGA DE10-Lite (Intel MAX10)**.

Las prácticas cubren conceptos fundamentales del diseño digital y sistemas embebidos, incluyendo:

- lógica combinacional
- máquinas de estados (FSM)
- contadores
- generación de PWM
- comunicación serial
- generación de video VGA
- lectura de sensores

El objetivo es desarrollar sistemas completos desde **diseño en Verilog hasta implementación en hardware real**.

---

# 🛠 Hardware y Software Utilizado

## Hardware
- FPGA **DE10-Lite (Intel MAX10)**
- Monitor **VGA**
- Sensor **acelerómetro ADXL345**
- Cable **USB Blaster**

## Software
- **Intel Quartus Prime Lite**
- **ModelSim (simulación)**
- **Verilog HDL**

---

# 📚 Prácticas Incluidas

| # | Práctica | Descripción |
|---|---|---|
| 1 | Número Primo | Determina si un número ingresado en switches es primo y enciende un LED |
| 2 | Conversor BCD a 7 segmentos | Conversión de números a displays de 7 segmentos |
| 3 | Contador a 100 | Contador ascendente y descendente con carga de valor |
| 4 | Sistema de Contraseña | Sistema de acceso con verificación de contraseña usando switches |
| 5 | Control PWM | Generación de señal PWM controlada por switches |
| 6 | UART | Comunicación serial entre transmisor y receptor |
| 7 | VGA | Generación de señal VGA mostrando un tablero de ajedrez |
| 8 | Acelerómetro | Lectura del sensor ADXL345 mediante SPI |

---

# 📂 Estructura del Repositorio

```
FPGA_Labs/
│
├── Practica_1_Numero_Primo
│
├── Practica_2_BCD_Display
│
├── Practica_3_Contador_100
│
├── Practica_4_Contrasena
│
├── Practica_5_PWM
│
├── Practica_6_UART
│
├── Practica_7_VGA
│
├── Practica_8_Acelerometro
│
└── README.md
```

Cada práctica incluye:

- código en **Verilog**
- módulos utilizados
- explicación del funcionamiento
- imágenes o evidencia del funcionamiento

---

# 🧠 Conceptos de Diseño Cubiertos

Las prácticas implementan múltiples conceptos del diseño digital.

## 🔹 Lógica combinacional
- verificación de números primos
- conversión BCD

## 🔹 Lógica secuencial
- contadores
- registros

## 🔹 Máquinas de estados (FSM)
- sistema de contraseña
- control UART

## 🔹 Generación de señales
- PWM
- divisores de reloj

## 🔹 Protocolos de comunicación
- **UART**
- **SPI**

## 🔹 Video digital
- generación de sincronización **VGA**
- control de píxeles

## 🔹 Integración con sensores
- lectura de acelerómetro

---

# 🎯 Objetivo Académico

Este repositorio fue desarrollado como parte de prácticas de **Diseño Digital con FPGA**, con el objetivo de:

- comprender la arquitectura de sistemas digitales
- implementar módulos en **Verilog HDL**
- integrar múltiples componentes en hardware real
- trabajar con **interfaces de comunicación y sensores**

---

# 👨‍💻 Autor

Ángeles Araiza García A00574806

Proyecto académico de **Diseño Digital con FPGA utilizando Verilog HDL**.

Implementado en **Intel DE10-Lite FPGA**.
