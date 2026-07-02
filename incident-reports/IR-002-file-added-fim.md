# IR-002 - Archivo agregado en ruta monitoreada por FIM

## Resumen ejecutivo

Se detecto la creacion de un archivo nuevo en una ruta monitoreada por File Integrity Monitoring en el endpoint `linux-agent-01`. El evento fue generado de manera controlada para validar la capacidad de Wazuh de detectar cambios de archivos en tiempo real.

## Datos del caso

| Campo | Valor |
| --- | --- |
| Caso | IR-002 |
| Tipo | File Integrity Monitoring |
| Endpoint | linux-agent-01 |
| Ruta | /opt/blue-team-lab-fim/test-file.txt |
| Eventos | added, deleted |
| Reglas | 554, 553 |
| Severidad observada | Nivel 5 y Nivel 7 |
| Estado | Cerrado como prueba controlada |

## Linea de tiempo

| Momento | Evento |
| --- | --- |
| T0 | Se configura una ruta de laboratorio en FIM |
| T1 | Se reinicia `wazuh-agent` |
| T2 | Se crea `test-file.txt` |
| T3 | Wazuh Agent detecta el cambio |
| T4 | Wazuh Dashboard muestra la alerta `File added to the system` |
| T5 | Se elimina el archivo de prueba |
| T6 | Wazuh Dashboard muestra la alerta `File deleted` |

## Analisis

Las alertas corresponden a la adicion y eliminacion de un archivo en una ruta monitoreada. En este laboratorio la actividad es esperada. En produccion, un archivo nuevo o eliminado en una ruta critica podria indicar persistencia, modificacion no autorizada, despliegue indebido, limpieza de rastros o preparacion de actividad maliciosa.

## Evidencia

- Agente afectado: `linux-agent-01`
- Ruta observada: `/opt/blue-team-lab-fim/test-file.txt`
- Modulo: File Integrity Monitoring
- Reglas activadas: `554`, `553`

## Contencion

No se requirio contencion porque fue una prueba controlada dentro de un laboratorio aislado.

## Recomendaciones

- Monitorear rutas criticas del sistema.
- Correlacionar cambios de archivos con usuarios, comandos y eventos de autenticacion.
- Documentar excepciones esperadas para reducir ruido.
- Crear casos de uso para rutas sensibles como configuraciones SSH, sudoers y servicios systemd.

## Resultado

Caso cerrado como ejercicio exitoso de validacion de FIM.
