#!/usr/bin/env bash
set -euo pipefail

LAB_DIR="/opt/blue-team-lab-fim"
OSSEC_CONF="/var/ossec/etc/ossec.conf"
BACKUP="/var/ossec/etc/ossec.conf.bak-fim-lab"
FIM_LINE='    <directories realtime="yes" check_all="yes">/opt/blue-team-lab-fim</directories>'

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script with sudo:"
  echo "sudo bash $0"
  exit 1
fi

echo "[1/5] Creating lab directory: ${LAB_DIR}"
mkdir -p "${LAB_DIR}"

echo "[2/5] Backing up Wazuh agent configuration"
if [[ ! -f "${BACKUP}" ]]; then
  cp "${OSSEC_CONF}" "${BACKUP}"
fi

echo "[3/5] Enabling realtime FIM for ${LAB_DIR}"
if ! grep -q "${LAB_DIR}" "${OSSEC_CONF}"; then
  sed -i "/<\/syscheck>/i\\${FIM_LINE}" "${OSSEC_CONF}"
fi

echo "[4/5] Restarting Wazuh agent"
systemctl restart wazuh-agent

echo "[5/5] Generating test file events"
echo "created at $(date -Is)" > "${LAB_DIR}/test-file.txt"
echo "modified at $(date -Is)" >> "${LAB_DIR}/test-file.txt"

echo
echo "Done. In Wazuh, search for: blue-team-lab-fim"
echo "Expected: file added / file modified alerts from linux-agent-01."

