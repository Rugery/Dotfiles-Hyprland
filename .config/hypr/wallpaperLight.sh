#!/bin/bash

# Carpeta donde se almacenan los wallpapers
WALLPAPER_DIR="$HOME/Imágenes/Wallpapers/"

# Seleccionar el primer wallpaper para el primer monitor
SELECTED_WALLPAPER_1=$(find "$WALLPAPER_DIR" -type f -exec basename {} \; | wofi -c ~/.config/wofi/config1 --show dmenu --prompt "Select Wallpaper for Monitor 1:")
FULL_PATH_1=$(find "$WALLPAPER_DIR" -type f -name "$SELECTED_WALLPAPER_1")

# Seleccionar el segundo wallpaper para el segundo monitor
SELECTED_WALLPAPER_2=$(find "$WALLPAPER_DIR" -type f -exec basename {} \; | wofi -c ~/.config/wofi/config1 --show dmenu --prompt "Select Wallpaper for Monitor 2:")
FULL_PATH_2=$(find "$WALLPAPER_DIR" -type f -name "$SELECTED_WALLPAPER_2")

# Verificar si las imágenes existen
if [ ! -f "$FULL_PATH_1" ]; then
    echo "El archivo de imagen para el Monitor 1 no se encuentra."
    exit 1
fi

if [ ! -f "$FULL_PATH_2" ]; then
    echo "El archivo de imagen para el Monitor 2 no se encuentra."
    exit 1
fi

# Obtener los identificadores de los monitores
MONITOR_1="eDP-1"  # Cambia esto si el nombre del monitor es diferente
MONITOR_2="DP-1"   # Cambia esto si el nombre del monitor es diferente

# Aplicar el wallpaper para el Monitor 1
echo "Aplicando wallpaper para el Monitor 1: $SELECTED_WALLPAPER_1"
swww img -o "$MONITOR_1" "$FULL_PATH_1" --transition-type any --transition-fps 60 --transition-duration .5

# Aplicar el wallpaper para el Monitor 2
echo "Aplicando wallpaper para el Monitor 2: $SELECTED_WALLPAPER_2"
swww img -o "$MONITOR_2" "$FULL_PATH_2" --transition-type any --transition-fps 60 --transition-duration .5

# Aplicar esquema de colores con pywal
wal -l -i "$FULL_PATH_1" -n --cols16

# Recargar CSS para cambiar colores
swaync-client --reload-css

# Actualizar pywalfox
pywalfox update

# Ajustar colores para Cava (si es necesario)
color1=$(awk 'match($0, /color2=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
color2=$(awk 'match($0, /color3=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
cava_config="$HOME/.config/cava/config"
sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" $cava_config
sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" $cava_config

# Reiniciar Cava si es necesario
pkill -USR2 cava || cava -p $cava_config

