# IR-001 - Intento fallido de sudo en endpoint Linux

## Resumen ejecutivo

Se detecto un intento fallido de ejecucion con privilegios mediante `sudo` en el endpoint `linux-agent-01`. El evento fue generado de manera controlada como parte de un laboratorio Blue Team para validar la recoleccion de logs y la generacion de alertas en Wazuh.

## Datos del caso

| Campo | Valor |
| --- | --- |
| Caso | IR-001 |
| Tipo | Authentication failure |
| Endpoint | linux-agent-01 |
| Fuente | Wazuh |
| Severidad observada | Nivel 5 |
| Estado | Cerrado como prueba controlada |

## Alertas relacionadas

| Rule ID | Descripcion | Nivel |
| --- | --- | --- |
| 5401 | Failed attempt to run sudo. | 5 |
| 5503 | PAM: User login failed. | 5 |

## Linea de tiempo

| Momento | Evento |
| --- | --- |
| T0 | Se ejecuta `sudo -k` para invalidar credenciales cacheadas |
| T1 | Se ejecuta `sudo ls /root` |
| T2 | Se ingresa una contrasena incorrecta de forma controlada |
| T3 | Linux registra el fallo de autenticacion |
| T4 | Wazuh Agent envia el evento |
| T5 | Wazuh Dashboard muestra la alerta en Threat Hunting |

## Analisis

El evento corresponde a un fallo de autenticacion local. En un ambiente productivo, un unico fallo puede ser benigno, pero multiples fallos, combinados con horarios inusuales o actividad de red sospechosa, podrian indicar intento de acceso no autorizado o abuso de privilegios.

## Evidencia

- Agente afectado: `linux-agent-01`
- Reglas activadas: `5401`, `5503`
- Vista usada: Wazuh Threat Hunting

## Contencion

No se requirio contencion porque fue una prueba controlada dentro de un laboratorio aislado.

## Recomendaciones

- Monitorear volumen de fallos por usuario y endpoint.
- Crear una alerta de mayor prioridad si existen multiples fallos en una ventana corta.
- Revisar eventos SSH si el fallo ocurre desde acceso remoto.
- Correlacionar con cambios de archivos sensibles y elevacion de privilegios.

## Resultado

Caso cerrado como ejercicio exitoso de validacion de telemetria.

