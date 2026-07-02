# Guia para GitHub y LinkedIn

## Por que este proyecto sirve para reclutadores

Este laboratorio muestra habilidades practicas que se buscan en roles Junior SOC / Blue Team:

- Montaje de laboratorio seguro.
- Uso de SIEM/XDR open source.
- Instalacion de agentes.
- Analisis de alertas reales.
- Documentacion de hallazgos.
- Criterio para no exponer secretos ni sistemas externos.

## Que subir a GitHub

Subir:

- README con arquitectura y objetivos.
- Documentacion paso a paso.
- Capturas sin contrasenas.
- Reportes de incidente.
- Notas de deteccion y reglas futuras.

No subir:

- Contrasenas.
- Tokens.
- Llaves privadas.
- Capturas con credenciales.
- IPs publicas propias.
- Archivos de configuracion con secretos.

## Descripcion corta para GitHub

```text
Laboratorio Blue Team con Wazuh, Ubuntu Server y VirtualBox. Incluye instalacion de Wazuh Manager, registro de agente Linux, deteccion de autenticacion fallida y reporte de incidente estilo SOC.
```

## Post sugerido para LinkedIn

```text
Estoy construyendo un laboratorio Blue Team local para practicar tareas de SOC de forma segura y etica.

En esta primera fase configure:
- Wazuh Manager con dashboard web.
- Un endpoint Linux monitoreado con Wazuh Agent.
- Red Host-only en VirtualBox para mantener el entorno aislado.
- Un ejercicio controlado de autenticacion fallida detectado en Threat Hunting.

Resultado:
Wazuh detecto eventos como "Failed attempt to run sudo" y "PAM: User login failed" desde el agente linux-agent-01.

Estoy documentando cada ejercicio como mini reportes de incidente para fortalecer mi portafolio Blue Team.
```

## Como explicarlo en entrevista

Respuesta breve:

```text
Monte un laboratorio local con VirtualBox y Wazuh para practicar monitoreo defensivo. Configure un manager y un agente Linux, valide conectividad por red Host-only y genere eventos controlados de autenticacion fallida. Luego investigue las alertas en Threat Hunting y documente el caso como si fuera un ticket SOC.
```

## Proximos ejercicios para fortalecer el portafolio

1. File Integrity Monitoring sobre archivos sensibles.
2. Deteccion de varios intentos fallidos de autenticacion.
3. Monitoreo de cambios en servicios con `systemctl`.
4. Integracion futura de endpoint Windows con Sysmon.
5. Mini reporte de incidente por cada ejercicio.

