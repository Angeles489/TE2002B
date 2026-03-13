# 🔢 Práctica 3 – Contador a 100 en FPGA

## 📌 Descripción

En esta práctica se implementa un **contador digital configurable hasta 100** utilizando **Verilog HDL** en una FPGA.  
El sistema permite realizar conteo **ascendente o descendente**, además de permitir **cargar un valor inicial manualmente** mediante una entrada externa.

El contador reinicia automáticamente cuando alcanza su valor límite o cuando llega a cero, dependiendo de la dirección del conteo.

---

# 🎯 Objetivo

Diseñar un módulo en Verilog que:

- Implemente un **contador de 0 a 100**
- Permita **conteo ascendente y descendente**
- Permita **cargar un valor inicial**
- Utilice **reset asíncrono**
- Sea configurable mediante parámetros

---

# 🛠 Materiales y Herramientas

- Tarjeta FPGA **DE10-Lite**
- Software **Intel Quartus Prime Lite**
- Lenguaje **Verilog HDL**
- Cable **USB Blaster**

---

# ⚙️ Funcionamiento del Sistema

El sistema funciona a partir de una señal de reloj (`CLK`) que actualiza el valor del contador.

Dependiendo de las señales de control, el contador puede:

- Reiniciarse
- Cargar un valor externo
- Contar hacia arriba
- Contar hacia abajo

---

# 🎛 Entradas y Salidas

## Entradas

| Señal | Descripción |
|------|-------------|
| `CLK` | Señal de reloj |
| `rst` | Reset asíncrono del contador |
| `up_down` | Dirección del conteo (1 = ascendente, 0 = descendente) |
| `data_in[6:0]` | Valor a cargar en el contador |
| `load` | Activa la carga del valor de entrada |

---

## Salidas

| Señal | Descripción |
|------|-------------|
| `count[6:0]` | Valor actual del contador |

---

# 🧠 Módulo Principal

El módulo principal es:

```
Contador100
```

Este módulo implementa toda la lógica del contador.

### Parámetro configurable

```verilog
parameter CMAX = 100
```

Define el valor máximo del contador.

---

# 🔄 Lógica de Funcionamiento

El comportamiento del contador sigue la siguiente prioridad:

### 1️⃣ Reset

Si `rst` está activo:

```
count = 0
```

---

### 2️⃣ Carga de valor

Si `load` está activo:

```
count = data_in
```

Esto permite inicializar el contador en un valor específico.

---

### 3️⃣ Conteo Ascendente

Si `up_down = 1`:

```
count = count + 1
```

Cuando el contador llega a `CMAX`:

```
count → 0
```

---

### 4️⃣ Conteo Descendente

Si `up_down = 0`:

```
count = count - 1
```

Cuando el contador llega a `0`:

```
count → CMAX
```

---

# 🔁 Flujo del Sistema

```
        CLK
         │
         ▼
     Contador100
         │
         ▼
        count
```

El valor de `count` representa el estado actual del contador.

---

# 🧪 Simulación

Durante la simulación se verificó:

- Reset correcto del contador
- Conteo ascendente hasta 100
- Reinicio automático al superar el límite
- Conteo descendente hasta 0
- Carga de valores mediante `data_in`

---

# 📷 Evidencias

## Simulación

![Simulación contador](imagenes/simulacion_contador.png)

## Funcionamiento en FPGA

![Contador FPGA](imagenes/fpga_contador.jpg)

---

# ✅ Resultado

Se implementó correctamente un **contador bidireccional con carga de datos**, demostrando:

- uso de **lógica secuencial**
- manejo de **reset asíncrono**
- control de flujo mediante señales externas
- diseño modular en **Verilog**

---

# 👨‍💻 Autor

Práctica académica de **Diseño Digital con FPGA utilizando Verilog HDL**.
