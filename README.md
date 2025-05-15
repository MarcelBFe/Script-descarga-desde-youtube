# 🎬 YouTube Audio & Video Splitter Script

Este script en Bash permite descargar un video de YouTube usando `yt-dlp`, extraer su audio en formato `.mp3` y generar una versión del video sin audio en formato comprimido (`.mp4`).

⚠️ **Este script solo es compatible con sistemas Linux.**
No se garantiza su funcionamiento en macOS o Windows.

---

## 📦 Requisitos

El script utiliza las siguientes herramientas:

* [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)
* [`ffmpeg`](https://ffmpeg.org/)

Si no están instaladas, el script intentará instalarlas automáticamente.

---

## 🛠 Instalación

1. Clona este repositorio:

   ```bash
   git clone https://github.com/MarcelBFe/Script-descarga-desde-youtube.git
   cd Script-descarga-desde-youtube
   ```

2. Da permisos de ejecución al script:

   ```bash
   chmod +x descargar_video_audio.sh
   ```

---

## ▶️ Uso

Ejecuta el script con:

```bash
./descargar_video_audio.sh
```

### El script te permitirá:

* Introducir la URL de un video de YouTube
* Ver todos los formatos disponibles
* Elegir el formato deseado para descarga
* Obtener dos archivos:

  * `audio_extraido.mp3` → el audio del video
  * `video_sin_audio.mp4` → el video sin audio y comprimido
* Ver la información técnica de ambos archivos al finalizar

---

## 📁 Archivos generados

* `audio_extraido.mp3` – archivo de audio extraído
* `video_sin_audio.mp4` – archivo de video sin audio

---

## ❗Notas

* Asegúrate de tener privilegios de superusuario (`sudo`) para instalar herramientas si es necesario.
* La descarga del video depende de la disponibilidad y accesibilidad del contenido en YouTube.
