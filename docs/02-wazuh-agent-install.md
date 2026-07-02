# 02 - Instalacion del Wazuh Agent en Linux

## Objetivo

Registrar `linux-agent-01` como endpoint monitoreado en el Wazuh Manager.

## Contexto

El dashboard de Wazuh ya estaba funcionando en:

```text
https://WAZUH_MANAGER_IP
```

El endpoint Linux tenia conectividad hacia el manager por la red Host-only.

## Instalacion

Durante la instalacion se uso el paquete oficial de Wazuh Agent para Linux.

Comando usado para descargar el paquete:

```bash
curl -O https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.14.0-1_amd64.deb
```

Instalacion apuntando al manager:

```bash
sudo WAZUH_MANAGER="WAZUH_MANAGER_IP" dpkg -i ./wazuh-agent_4.14.0-1_amd64.deb
```

Activacion del servicio:

```bash
sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
sudo systemctl status wazuh-agent --no-pager
```

## Resultado esperado

El servicio debe aparecer como:

```text
Active: active (running)
```

En el dashboard:

```text
Agents summary: Active (1)
```

## Problema encontrado

Durante el intento inicial con repositorio APT aparecio el error:

```text
The method driver /usr/lib/apt/methods/https could not be found.
```

## Solucion aplicada

Para no bloquear el laboratorio, se descargo el paquete `.deb` directamente desde el repositorio oficial y se instalo con `dpkg`. Esta decision permitio avanzar sin modificar el alcance del laboratorio.

## Leccion aprendida

En un entorno real, un analista o administrador debe saber diagnosticar fallos de instalacion, validar conectividad y elegir una alternativa segura sin saltarse el origen confiable del software.
