# 🔐 Práctica 4 – Sistema de Verificación de Contraseña en FPGA

## 📌 Descripción

En esta práctica se implementa un **sistema digital de verificación de contraseña** utilizando **Verilog HDL** en una FPGA.

El sistema permite ingresar una contraseña de **16 bits**, dividida en **4 bloques de 4 bits**, utilizando los switches de la FPGA.  
Cada bloque se confirma mediante un botón, y el sistema verifica si coincide con la contraseña almacenada.

El resultado se muestra en los **displays de 7 segmentos**, indicando si la contraseña es **correcta (GOOD)** o **incorrecta (BAD)**.

---

# 🎯 Objetivo

Diseñar una **máquina de estados finita (FSM)** que:

- Permita ingresar una contraseña en **4 pasos**
- Verifique cada bloque ingresado
- Muestre el progreso en displays
- Indique si la contraseña es **correcta o incorrecta**

---

# 🛠 Materiales y Herramientas

- Tarjeta FPGA **DE10-Lite**
- Software **Intel Quartus Prime Lite**
- Lenguaje **Verilog HDL**
- Cable **USB Blaster**

---

# ⚙️ Funcionamiento del Sistema

El sistema funciona mediante **estados secuenciales**, donde cada estado valida una parte de la contraseña.

La contraseña está definida como:

```verilog
parameter [15:0] password = 16'h1541;
```

Esto significa que la contraseña se ingresa en el siguiente orden:

| Paso | Bits verificados |
|-----|------------------|
| 1 | password[3:0] |
| 2 | password[7:4] |
| 3 | password[11:8] |
| 4 | password[15:12] |

---

# 🎛 Entradas y Salidas

## Entradas

| Señal | Descripción |
|------|-------------|
| `clk` | Reloj del sistema |
| `SW[3:0]` | Switches para ingresar los valores |
| `KEY[0]` | Reset del sistema |
| `KEY[1]` | Confirmar valor ingresado |

---

## Salidas

| Señal | Descripción |
|------|-------------|
| `HEX0` | Display 7 segmentos |
| `HEX1` | Display 7 segmentos |
| `HEX2` | Display 7 segmentos |
| `HEX3` | Display 7 segmentos |

Los displays muestran:

- Los números ingresados
- El resultado de la verificación

---

# 🧠 Arquitectura del Sistema

El sistema incluye los siguientes componentes:

```
📂 Practica_4_Password
 ├── practica4.v
 ├── BCD_module.v
 ├── testbench.v
 ├── imagenes/
 └── README.md
```

---

# ⏱ Divisor de Reloj

Se implementa un **clock divider** para reducir la frecuencia del reloj de la FPGA y hacer el sistema más estable para la interacción con botones.

```verilog
reg [25:0] counter;
reg clk_div;
```

El reloj dividido se obtiene de:

```
clk_div = counter[25]
```

---

# 🔄 Máquina de Estados (FSM)

El sistema utiliza una **máquina de estados finita** con los siguientes estados:

| Estado | Descripción |
|------|-------------|
| `IDLE` | Espera el primer valor |
| `S1` | Verifica primeros 4 bits |
| `S2` | Verifica segundos 4 bits |
| `S3` | Verifica terceros 4 bits |
| `GOOD` | Contraseña correcta |
| `BAD` | Contraseña incorrecta |

### Flujo de estados

```
        IDLE
         |
         ▼
        S1
         |
         ▼
        S2
         |
         ▼
        S3
       /  \
      ▼    ▼
    GOOD  BAD
```

Si en cualquier paso el valor no coincide con la contraseña, el sistema pasa al estado **BAD**.

---

# 📟 Visualización en Displays

Durante la entrada de datos:

- Los valores ingresados se muestran en los displays mediante un módulo **BCD**.

Cuando se verifica la contraseña:

### GOOD

El sistema muestra la palabra **GOOD** en los displays.

### BAD

El sistema muestra la palabra **BAD** indicando que la contraseña es incorrecta.

---

# 🧪 Procedimiento de Uso

1. Ingresar el primer valor usando `SW[3:0]`.
2. Presionar `KEY[1]` para verificar.
3. Repetir el proceso para los siguientes bloques.
4. Si todos coinciden con la contraseña almacenada → **GOOD**.
5. Si algún bloque es incorrecto → **BAD**.

---

# 📷 Evidencias

## Simulación

![Simulación](imagenes/simulacion_password.png)

## Funcionamiento en FPGA

![Funcionamiento](imagenes/fpga_password.jpg)

---

# ✅ Resultado

Se implementó correctamente un sistema de **verificación de contraseña mediante una máquina de estados**, demostrando el uso de:

- FSM en Verilog
- manejo de entradas mediante switches
- interacción con botones
- visualización en displays de 7 segmentos

---

# 👨‍💻 Autor

Práctica académica de **Diseño Digital con FPGA utilizando Verilog HDL**.
