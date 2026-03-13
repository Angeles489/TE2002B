# 🧠 Prácticas de Diseño Digital con FPGA (Verilog)

Repositorio que contiene una colección de **prácticas de diseño digital implementadas en FPGA** utilizando **Verilog HDL**.  
Cada práctica aborda diferentes conceptos fundamentales como lógica combinacional, contadores, máquinas de estados y generación de señales PWM.

Las prácticas fueron desarrolladas para ejecutarse en una **FPGA DE10-Lite**, utilizando el software **Intel Quartus Prime Lite**.

---

# 🎯 Objetivo del Repositorio

Documentar y demostrar la implementación de distintos sistemas digitales en FPGA, aplicando conceptos como:

- Diseño modular en Verilog
- Lógica combinacional
- Lógica secuencial
- Contadores
- Máquinas de estados finitas (FSM)
- Conversión BCD
- Control de displays de 7 segmentos
- Generación de señales PWM

---

# 🛠 Herramientas Utilizadas

- FPGA **DE10-Lite**
- **Intel Quartus Prime Lite**
- **Verilog HDL**
- **ModelSim** para simulación
- Cable **USB Blaster**

---

# 📚 Lista de Prácticas

| Práctica | Tema | Descripción |
|--------|------|-------------|
| **Práctica 1** | Número Primo | Sistema que determina si un número binario ingresado mediante switches es primo. |
| **Práctica 2** | Conversión BCD | Conversión de un número binario a unidades, decenas, centenas y millares para mostrarlos en displays de 7 segmentos. |
| **Práctica 3** | Contador a 100 | Contador ascendente y descendente con capacidad de carga de datos. |
| **Práctica 4** | Verificación de Contraseña | Máquina de estados que valida una contraseña de 16 bits ingresada en 4 pasos. |
| **Práctica 5** | Generador PWM | Generación de una señal PWM controlada mediante switches. |

---

# 📂 Estructura del Repositorio

```
FPGA-Practicas
│
├── Practica1_NumeroPrimo
│   ├── modulos.v
│   ├── testbench.v
│   ├── imagenes
│   └── README.md
│
├── Practica2_BCD_Displays
│   ├── BCD_4displays.v
│   ├── BCD_module.v
│   ├── testbench.v
│   ├── imagenes
│   └── README.md
│
├── Practica3_Contador100
│   ├── Contador100.v
│   ├── modulos_extra.v
│   ├── testbench.v
│   ├── imagenes
│   └── README.md
│
├── Practica4_PasswordFSM
│   ├── practica4.v
│   ├── BCD_module.v
│   ├── testbench.v
│   ├── imagenes
│   └── README.md
│
├── Practica5_PWM
│   ├── pwm.v
│   ├── contador.v
│   ├── clock_divider.v
│   ├── BCD_4displays.v
│   ├── imagenes
│   └── README.md
│
└── README.md
```

---

# 🧠 Conceptos Aplicados

A lo largo de estas prácticas se aplican conceptos importantes del diseño digital:

- Diseño jerárquico de módulos
- Uso de parámetros en Verilog
- Manejo de señales de reloj
- Contadores síncronos
- Máquinas de estados finitas (FSM)
- Generación de señales PWM
- Conversión de datos para visualización en displays

---

# 📟 Hardware Utilizado

Las prácticas están diseñadas para la FPGA:

**DE10-Lite**

Elementos utilizados de la tarjeta:

- Switches (`SW`)
- Botones (`KEY`)
- Displays de 7 segmentos (`HEX`)
- LEDs

---

# 📷 Evidencias

Cada práctica incluye:

- Capturas de **simulación**
- Imágenes del **funcionamiento en FPGA**
- Archivos **.v** de los módulos
- Testbench para verificación

---

# 🚀 Posibles Mejoras Futuras

- Implementación de interfaces UART
- Comunicación con sensores externos
- Control de servomotores con PWM
- Sistemas digitales más complejos

---

# 👨‍💻 Autor

Ángeles Araiza García A00574806
