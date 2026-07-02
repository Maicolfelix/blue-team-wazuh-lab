# Arquitectura del laboratorio

```mermaid
flowchart LR
    subgraph Host["Windows Host"]
        Browser["Navegador web"]
        VBox["Oracle VirtualBox"]
    end

    subgraph LabNet["VirtualBox Host-only Network LAB_HOST_ONLY_NETWORK"]
        Manager["BT-Wazuh-Ubuntu\nWazuh Manager + Indexer + Dashboard\nWAZUH_MANAGER_IP"]
        Agent["BT-Linux-Agent\nWazuh Agent\nlinux-agent-01"]
    end

    Browser -->|"HTTPS 443"| Manager
    Agent -->|"Eventos y telemetria"| Manager
    VBox --> Manager
    VBox --> Agent
```

## Roles

| Componente | Rol |
| --- | --- |
| Windows Host | Equipo anfitrion y navegador para entrar al dashboard |
| BT-Wazuh-Ubuntu | Servidor central de Wazuh |
| BT-Linux-Agent | Endpoint Linux monitoreado |
| Red Host-only | Segmento local aislado para comunicacion entre host y VMs |

## Por que Host-only

La red Host-only permite que el host Windows y las maquinas virtuales se comuniquen entre si sin exponer los servicios del laboratorio a la red externa. Para un laboratorio inicial de Blue Team, esto reduce el riesgo y facilita controlar el alcance de las pruebas.
