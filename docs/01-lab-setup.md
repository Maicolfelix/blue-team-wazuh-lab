# 01 - Preparacion del laboratorio

## Objetivo

Construir un entorno local para practicar tareas defensivas de Blue Team sin poner en riesgo el equipo principal.

## Maquinas virtuales

| VM | Sistema | Rol | Red |
| --- | --- | --- | --- |
| BT-Wazuh-Ubuntu | Ubuntu Server 24.04 LTS | Wazuh Manager/Dashboard | NAT + Host-only |
| BT-Linux-Agent | Ubuntu Server 24.04 LTS | Endpoint monitoreado | NAT + Host-only |

## Configuracion recomendada

### Wazuh Manager

- RAM: 6 GB o mas si el equipo lo permite.
- CPU: 2 nucleos o mas.
- Disco: 60 GB dinamico.
- Red:
  - Adaptador 1: NAT para actualizaciones.
  - Adaptador 2: Host-only para comunicacion local con agentes.

### Linux Agent

- RAM: 2 GB.
- CPU: 2 nucleos.
- Disco: 25 GB dinamico.
- Red:
  - Adaptador 1: NAT.
  - Adaptador 2: Host-only.

## Direccionamiento observado

| Equipo | IP host-only |
| --- | --- |
| BT-Wazuh-Ubuntu | WAZUH_MANAGER_IP |
| BT-Linux-Agent | LINUX_AGENT_IP |

El valor exacto puede cambiar si VirtualBox asigna otra direccion por DHCP.

## Validacion basica

En el agente Linux:

```bash
ip -4 a
ping -c 4 WAZUH_MANAGER_IP
```

Resultado esperado:

- La VM agente tiene una IP privada dentro de `LAB_HOST_ONLY_NETWORK`.
- El ping al Wazuh Manager responde correctamente.

## Buenas practicas aplicadas

- Uso de snapshots antes de cambios importantes.
- Separacion entre servidor Wazuh y endpoint monitoreado.
- Uso de Host-only para limitar exposicion.
- No uso de malware real ni objetivos externos.
