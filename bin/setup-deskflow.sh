#!/usr/bin/env bash
set -euo pipefail

CONF="$HOME/.config/Deskflow/Deskflow.conf"
SERVER="${1:-}"
NAME="${2:-$(hostname)}"

if [ ! -f "$CONF" ]; then
  echo "Error: $CONF not found. Start deskflow once so it writes its config, then rerun."
  exit 1
fi

if pgrep -x deskflow >/dev/null 2>&1; then
  echo "Error: deskflow is running and rewrites this file on exit. Quit it, then rerun."
  exit 1
fi

set_key() {
  local section="$1" key="$2" value="$3"
  python3 - "$CONF" "$section" "$key" "$value" <<'PY'
import sys

path, section, key, value = sys.argv[1:5]
lines = open(path, encoding="utf-8").read().splitlines()
out, in_section, written = [], False, False
for line in lines:
    if line.startswith("["):
        if in_section and not written:
            out.append(f"{key}={value}")
            written = True
        in_section = line.strip() == f"[{section}]"
    elif in_section and line.split("=", 1)[0] == key:
        line, written = f"{key}={value}", True
    out.append(line)
if in_section and not written:
    out.append(f"{key}={value}")
    written = True
if not written:
    out.extend(["", f"[{section}]", f"{key}={value}"])
open(path, "w", encoding="utf-8").write("\n".join(out) + "\n")
PY
}

set_key gui autoHide true
set_key gui closeToTray true
set_key core screenName "$NAME"
if [ -n "$SERVER" ]; then
  set_key client remoteHost "$SERVER"
  set_key core coreMode 1
fi

echo "deskflow configured: screen '$NAME', hides to tray on start"
[ -n "$SERVER" ] && echo "client of $SERVER"
echo "hotkeys live on the server, not here: keyd and this client never see each other's input"
