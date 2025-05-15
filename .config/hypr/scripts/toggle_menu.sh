#!/usr/bin/env bash

# Verifica si Rofi ya está ejecutándose
if pgrep -x "wofi" > /dev/null
then
    # Si Rofi está ejecutándose, envía un comando para cerrarlo
    pkill wofi
else
    # Si Rofi no está ejecutándose, ejecuta tu launcher
    wofi --show drun
fi
