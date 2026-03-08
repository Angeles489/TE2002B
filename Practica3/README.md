# 🔢 Práctica 3 – Contador a 100 en FPGA

## 📌 Descripción

En esta práctica se implementa un **contador configurable hasta 100** utilizando **Verilog HDL** en una FPGA.  
El sistema permite contar de forma **ascendente o descendente**, así como **cargar un valor inicial manualmente** mediante una entrada de datos.

El valor del contador se muestra en **tres displays de 7 segmentos** de la FPGA.

---

## 🎯 Objetivo

Diseñar e implementar un contador digital que:

- Cuente de **0 a 100**
- Permita conteo **ascendente o descendente**
- Permita **cargar un valor inicial**
- Muestre el valor actual en **displays de 7 segmentos**

---

## 🛠 Materiales y Herramientas

- Tarjeta FPGA **DE10-Lite**
- Software **Intel Quartus Prime Lite**
- Lenguaje **Verilog HDL**
- Cable USB Blaster

---

# ⚙️ Funcionamiento del Sistema

El sistema recibe diferentes señales de control para manipular el contador.

### Entradas

| Señal | Descripción |
|------|-------------|
| `CLK` | Señal de reloj de la FPGA |
| `rst` | Reinicia el contador a 0 |
| `up_down` | Define dirección del conteo (1 = ascendente, 0 = descendente) |
| `load` | Permite cargar un valor manual |
| `data_in[6:0]` | Valor inicial que se carga en el contador |

### Salidas

| Señal | Descripción |
|------|-------------|
| `HEX0` | Display de unidades |
| `HEX1` | Display de decenas |
| `HEX2` | Display de centenas |

---

# 🧠 Arquitectura del Diseño

El sistema está compuesto por varios módulos:

```
📂 Practica_3_Contador100
 ├── Contador100.v
 ├── top.v
 ├── CLK_divider.v
 ├── BCD_module.v
 ├── BCD_4displays.v
 ├── testbench.v
 ├── imagenes/
 └── README.md
```

---

# 🔧 Módulo Principal: Contador100

Este módulo implementa la lógica del contador.

### Características

- Conteo **ascendente y descendente**
- Límite máximo configurable (`CMAX`)
- Posibilidad de **cargar un valor inicial**
- Reset asíncrono

### Parámetro

```
CMAX = 100
```

### Funcionamiento

1. Si `rst` se activa → el contador se reinicia a **0**.
2. Si `load` se activa → se carga el valor de `data_in`.
3. Si `up_down = 1` → conteo **ascendente**.
4. Si `up_down = 0` → conteo **descendente**.

Cuando el contador alcanza:

- **100** → vuelve a **0** (modo ascendente)
- **0** → vuelve a **100** (modo descendente)

---

# 🔧 Módulo Top

El módulo `top` integra todos los componentes del sistema.

### Componentes conectados

- `Contador100` → lógica del contador
- `CLK_divider` → divide la frecuencia del reloj
- `BCD_module` → conversión a BCD
- `BCD_4displays` → control de displays

### Flujo del sistema

```
CLK
 │
 ▼
CLK Divider
 │
 ▼
Contador100
 │
 ▼
Conversión BCD
 │
 ▼
Displays 7 segmentos
```

---

# 📟 Visualización en Displays

El valor del contador se convierte a **BCD** y se muestra en:

| Display | Valor |
|-------|------|
| HEX0 | Unidades |
| HEX1 | Decenas |
| HEX2 | Centenas |

---

# 🧪 Simulación

Se realizó una simulación para verificar:

- Funcionamiento del conteo ascendente
- Funcionamiento del conteo descendente
- Carga de valores con `load`
- Reset del sistema

---

# 📷 Evidencias

## Simulación

![Simulación](imagenes/simulacion_contador.png)

## Funcionamiento en FPGA

![Funcionamiento](imagenes/fpga_contador.jpg)

---

# ✅ Resultado

El sistema implementado permite controlar un contador de **0 a 100**, configurable y visualizable en los **displays de la FPGA**, demostrando el correcto uso de módulos jerárquicos en **Verilog**.

---

# 👨‍💻 Autor

Práctica académica de diseño digital utilizando FPGA y Verilog HDL.
