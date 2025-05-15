#!/bin/bash

# --- Función para instalar herramientas si no existen ---
check_install() {
  if ! command -v $1 &> /dev/null; then
    echo "$1 no está instalado. Instalándolo..."
    if [[ "$1" == "yt-dlp" ]]; then
      sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
      sudo chmod +x /usr/local/bin/yt-dlp
    elif [[ "$1" == "ffmpeg" ]]; then
      sudo apt update && sudo apt install -y ffmpeg
    fi
  fi
}

# --- Verificar instalaciones ---
check_install yt-dlp
check_install ffmpeg

# --- Pedir URL ---
read -p "Introduce la URL del video de YouTube: " URL

# --- Mostrar formatos disponibles ---
echo "Obteniendo formatos disponibles..."
yt-dlp -F "$URL"

# --- Pedir formato al usuario ---
read -p "Introduce el código del formato que deseas descargar (ej: 22): " FORMAT

# --- Descargar video en formato seleccionado ---
echo "Descargando video..."
yt-dlp -f "$FORMAT" -o "video_temp.%(ext)s" "$URL"

# --- Extraer audio en mp3 ---
echo "Extrayendo audio en mp3..."
ffmpeg -i video_temp.* -vn -ab 192k -ar 44100 -y audio_extraido.mp3

# --- Crear video sin audio comprimido ---
echo "Creando video sin audio..."
ffmpeg -i video_temp.* -an -vcodec libx264 -crf 28 -preset fast -y video_sin_audio.mp4

# --- Mostrar info final ---
echo "Información del archivo de audio:"
ffmpeg -i audio_extraido.mp3

echo "Información del archivo de video sin audio:"
ffmpeg -i video_sin_audio.mp4

# --- Limpieza temporal (opcional) ---
# rm video_temp.*

echo "✅ Proceso completado."
