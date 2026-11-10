#!/usr/bin/env bash
# Zip the theme into .dist/speckle-theme.zip for Admin → Customize → Themes → Install → From your device
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p .dist
python3 - <<'PY'
import os, zipfile
with zipfile.ZipFile(".dist/speckle-theme.zip", "w", zipfile.ZIP_DEFLATED) as z:
    for top in ["about.json", "settings.yml", "common", "desktop", "mobile", "scss", "javascripts", "locales"]:
        if os.path.isfile(top):
            z.write(top); continue
        for root, _, files in os.walk(top):
            for f in files:
                if not f.startswith("."):
                    z.write(os.path.join(root, f))
PY
echo ".dist/speckle-theme.zip"
