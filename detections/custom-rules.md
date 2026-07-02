# Detecciones futuras

Este archivo documenta ideas de deteccion para ampliar el laboratorio.

## Deteccion 01 - Multiples fallos de sudo

Objetivo:

Detectar varios intentos fallidos de `sudo` en un periodo corto.

Hipotesis:

Un usuario legitimo puede fallar una vez. Varios fallos en poco tiempo pueden indicar intento de adivinar credenciales o abuso de privilegios.

Campos utiles:

- `agent.name`
- `rule.id`
- `rule.description`
- `user.name`
- `timestamp`

Reglas base observadas:

- `5401`: Failed attempt to run sudo.
- `5503`: PAM: User login failed.

## Deteccion 02 - Cambios en archivos sensibles

Objetivo:

Detectar modificaciones en archivos criticos de Linux.

Archivos candidatos:

- `/etc/passwd`
- `/etc/shadow`
- `/etc/sudoers`
- `/etc/ssh/sshd_config`

Modulo:

- File Integrity Monitoring

## Deteccion 03 - Servicio sospechoso habilitado

Objetivo:

Investigar cuando se habilita o inicia un servicio nuevo.

Comandos a observar:

- `systemctl enable`
- `systemctl start`
- cambios bajo `/etc/systemd/system`

