# 03 - Deteccion de autenticacion fallida

## Objetivo

Validar que Wazuh recibe y clasifica eventos de autenticacion fallida generados desde el endpoint Linux.

## Escenario

Se simulo un error de autenticacion local usando `sudo` con una contrasena incorrecta de forma controlada.

## Accion ejecutada en el endpoint

```bash
sudo -k
sudo ls /root
```

Cuando el sistema pidio la contrasena, se ingreso un valor incorrecto una sola vez.

## Flujo de deteccion

```text
Intento fallido de sudo
-> PAM registra el fallo
-> Wazuh Agent recolecta el evento
-> Wazuh Manager procesa el log
-> Wazuh aplica reglas
-> El dashboard muestra alertas en Threat Hunting
```

## Alertas observadas

| Campo | Valor |
| --- | --- |
| agent.name | linux-agent-01 |
| rule.description | Failed attempt to run sudo. |
| rule.id | 5401 |
| rule.level | 5 |

Segundo evento relacionado:

| Campo | Valor |
| --- | --- |
| agent.name | linux-agent-01 |
| rule.description | PAM: User login failed. |
| rule.id | 5503 |
| rule.level | 5 |

## Evidencia

![Wazuh Threat Hunting - authentication failure](../screenshots/wazuh-threat-hunting-auth-failure.png)

## Interpretacion

El evento indica que un usuario intento ejecutar una accion con privilegios mediante `sudo`, pero fallo la autenticacion. Por si solo, un unico intento fallido puede ser actividad normal del usuario. En un SOC se debe revisar contexto adicional antes de escalar.

## Preguntas de triage

- Que usuario genero el evento?
- En que host ocurrio?
- Cuantas veces fallo?
- Ocurrio fuera de horario esperado?
- Hay otros eventos alrededor, como SSH fallido, cambios de archivos o ejecucion sospechosa?
- El mismo origen genero eventos en otros endpoints?

## Conclusion

La prueba confirma que el agente Linux reporta correctamente al Wazuh Manager y que las reglas de autenticacion generan alertas visibles para analisis.

