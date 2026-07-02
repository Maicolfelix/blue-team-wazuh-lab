# Scripts

Scripts auxiliares para ejecutar ejercicios del laboratorio con menos comandos manuales.

## FIM realtime lab

Configura una ruta de laboratorio para File Integrity Monitoring en tiempo real, reinicia el agente y genera un archivo de prueba.

Uso dentro de la VM `BT-Linux-Agent`:

```bash
curl -sLO https://raw.githubusercontent.com/Maicolfelix/blue-team-wazuh-lab/master/scripts/fim-realtime-lab.sh
sudo bash fim-realtime-lab.sh
```

Despues, en Wazuh, buscar:

```text
blue-team-lab-fim
```

