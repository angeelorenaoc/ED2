# -*- coding: utf-8 -*-

import random

def generar_numeros_hexadecimales(n):
    numeros_hex = []
    for _ in range(n):
        numero = random.randint(0, 2**32 - 1)  # Genera un número aleatorio de 32 bits
        numero_hex = '0x' + format(numero, '08x')  # Agrega '0x' al principio del número hexadecimal
        numeros_hex.append(numero_hex)
    return numeros_hex

N = 10  # Reemplaza esto con la cantidad de números que deseas generar
numeros_generados = generar_numeros_hexadecimales(N)

resultado = ', '.join(numeros_generados)  # Combina los elementos del arreglo en una cadena

print(resultado)