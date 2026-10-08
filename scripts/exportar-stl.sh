#!/usr/bin/env bash
# renderiza la caja de cada revision de hardware/ a .stl. por cada
# carpeta fuente hardware/bote-v-X-rev-Y/ deja la pieza en la carpeta
# de fabricacion hermana hardware/bote-v-X-rev-Y-fab/bote_caja.stl
#
# uso:
#   ./scripts/exportar-stl.sh                 exporta todas las revisiones
#   ./scripts/exportar-stl.sh bote-v-0-rev-a  exporta solo esa revision
set -uo pipefail

openscad="${OPENSCAD:-}"

if [ -z "$openscad" ]; then
  if command -v openscad >/dev/null 2>&1; then
    openscad="openscad"
  elif [ -x "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD" ]; then
    openscad="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
  fi
fi

if [ -z "$openscad" ] || ! command -v "$openscad" >/dev/null 2>&1; then
  echo "openscad no encontrado (definir OPENSCAD con la ruta al binario)" >&2
  exit 1
fi

raiz_repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ ! -f "$raiz_repo/terceros/popusintes-cajas-paneles/comun/comun.scad" ]; then
  echo "falta el submodulo terceros/popusintes-cajas-paneles, ejecutar:" >&2
  echo "  git submodule update --init" >&2
  exit 1
fi

if [ "$#" -gt 0 ]; then
  revisiones=("$@")
else
  revisiones=()
  for directorio in "$raiz_repo"/hardware/bote-v-*-rev-*/; do
    revision="$(basename "$directorio")"
    [[ "$revision" == *-fab ]] && continue
    revisiones+=("$revision")
  done
fi

estado=0
inicio=$(date +%s)

for revision in "${revisiones[@]}"; do
  fuente="$raiz_repo/hardware/$revision/bote.scad"
  if [ ! -f "$fuente" ]; then
    echo "$revision: no existe $fuente" >&2
    estado=1
    continue
  fi

  directorio_fab="$raiz_repo/hardware/$revision-fab"
  mkdir -p "$directorio_fab"

  salida="$directorio_fab/bote_caja.stl"
  echo "Exportando $salida..."

  if ! "$openscad" -o "$salida" --export-format binstl --quiet "$fuente"; then
    echo "$revision: fallo el render" >&2
    estado=1
  fi
done

fin=$(date +%s)
echo
echo "Listo en $((fin - inicio))s"

exit $estado
