# 🎛 Práctica 5 – Generación de Señal PWM en FPGA

## 📌 Descripción

En esta práctica se implementa un **generador de señal PWM (Pulse Width Modulation)** utilizando **Verilog HDL** en una FPGA.

El sistema permite controlar el **ciclo de trabajo (duty cycle)** de la señal PWM mediante los **switches de la FPGA**, limitando el valor máximo para mantener un rango adecuado de operación.

El valor ingresado se muestra en **displays de 7 segmentos**, mientras que la salida PWM puede utilizarse para controlar dispositivos externos como **servomotores, LEDs o control de potencia**.

---

# 🎯 Objetivo

Diseñar un sistema digital que:

- Genere una señal **PWM**
- Permita modificar el **duty cycle** mediante switches
- Muestre el valor ingresado en **displays de 7 segmentos**
- Utilice un **contador y un comparador** para generar la señal PWM

---

# 🛠 Materiales y Herramientas

- Tarjeta FPGA **DE10-Lite**
- Software **Intel Quartus Prime Lite**
- Lenguaje **Verilog HDL**
- Cable **USB Blaster**

---

# ⚙️ Funcionamiento del Sistema

El sistema genera una señal PWM comparando un **contador** con un **valor calculado a partir de los switches**.

El valor ingresado determina el **tiempo que la señal permanece en estado alto**, lo que define el **duty cycle**.

---

# 🎛 Entradas y Salidas

## Entradas

| Señal | Descripción |
|------|-------------|
| `clk` | Señal de reloj de la FPGA |
| `rst` | Reinicio del sistema |
| `SW[7:0]` | Valor de control para el duty cycle |

---

## Salidas

| Señal | Descripción |
|------|-------------|
| `pwm_out` | Señal PWM generada |
| `HEX0` | Display de unidades |
| `HEX1` | Display de decenas |
| `HEX2` | Display de centenas |

---

# 🧠 Arquitectura del Sistema

El sistema está compuesto por varios módulos:

```
📂 Practica_5_PWM
 ├── pwm.v
 ├── clock_divider.v
 ├── contador.v
 ├── BCD_4displays.v
 ├── testbench.v
 ├── imagenes/
 └── README.md
```

---

# ⏱ Divisor de Reloj

Se utiliza un **divisor de frecuencia** para reducir la velocidad del reloj de la FPGA y obtener un periodo adecuado para la señal PWM.

```verilog
clock_divider #(.FREQ(25_000_000))
```

Esto permite generar una señal más lenta para el contador.

---

# 🔢 Contador

El contador genera una secuencia de valores que se utilizan para comparar contra el valor calculado del duty cycle.

```verilog
contador #(.CMAX(500_000))
```

Este valor define el **periodo de la señal PWM**.

---

# ⚖️ Comparador PWM

La señal PWM se genera comparando el valor del contador con un límite calculado:

```verilog
comparador <= ((50000 * sw_lim) / 180) + 13500;
```

Si:

```
count <= comparador
```

entonces:

```
pwm_out = 1
```

De lo contrario:

```
pwm_out = 0
```

Esto produce la señal **PWM**.

---

# 🔒 Limitación del Valor de Entrada

Para evitar valores fuera de rango, el sistema limita el valor ingresado:

```verilog
if(SW > 180)
    sw_lim = 180;
else
    sw_lim = SW;
```

Esto asegura que el valor máximo utilizado sea **180**.

---

# 📟 Visualización en Displays

El valor ingresado se convierte a **BCD** y se muestra en los displays mediante el módulo:

```
BCD_4displays
```

| Display | Valor |
|-------|------|
| HEX0 | Unidades |
| HEX1 | Decenas |
| HEX2 | Centenas |

---

# 🧪 Procedimiento de Uso

1. Ajustar el valor de `SW[7:0]`.
2. El sistema calcula automáticamente el **duty cycle**.
3. El valor se muestra en los **displays de 7 segmentos**.
4. La salida `pwm_out` genera la señal PWM correspondiente.

---

# 📷 Evidencias

## Simulación

![Simulación PWM](imagenes/simulacion_pwm.png)

## Funcionamiento en FPGA

![PWM FPGA](imagenes/fpga_pwm.jpg)

---

# ✅ Resultado

Se implementó correctamente un **generador PWM controlado por switches**, demostrando el uso de:

- divisores de reloj
- contadores
- comparadores
- visualización en displays de 7 segmentos

Este sistema puede utilizarse como base para **control de servomotores, iluminación LED o control de potencia en sistemas electrónicos**.

---

# 👨‍💻 Autor

Práctica académica de **Diseño Digital con FPGA utilizando Verilog HDL**.
