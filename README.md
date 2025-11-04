# docker-chrome

Run multi-versions of chrome in docker VNC.

This project aims to provide a lightweight multi-version chrome testing environment for compatibility testing.

## 1. Summary

### 1.1 Basic image

We use `linuxserver/docker-baseimage-kasmvnc` as the base image.

### 1.2 Chrome package

Old version (48-104) of Chrome is downloaded from https://www.slimjet.com/chrome/google-chrome-old-version.php

New version (105-latest) of Chrome is downloaded from https://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/

### 1.3 Image tags named

`gitsang/chrome:{chrome-version}-{build-date}`

Visit https://hub.docker.com/r/gitsang/chrome/tags for available tags

## 2. Build from source

### 2.1 Build from existing dockerfile

```bash
docker build -f Dockerfile.google-chrome_86.0.4240.75 -t chrome:86.0.4240.75-20251104 .
```

### 2.2 Write your own dockerfile

See https://github.com/linuxserver/docker-baseimage-kasmvnc?tab=readme-ov-file#application-containers for more imformation

```dockerfile
FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

# Download and install applications

COPY /root /
```

Change the content of `/root/default/autostart` to your own application. For google-chrome, it should be `google-chrome --no-sandbox`

## 3. Run

### 3.1 Docker Cli

```bash
docker run -it --rm -p 3000:3000 gitsang/chrome:81.0.4044.92-20251103
```

### 3.2 Docker Compose

```yaml
services:
  chrome-81:
    image: gitsang/chrome:81.0.4044.92-20251103
    container_name: chrome-81
    restart: unless-stopped
    shm_size: "512mb"
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    ports:
      - "3000:3000"
    volumes:
      # optional
      - /etc/fonts:/etc/fonts
      - /usr/share/fonts:/usr/share/fonts
      - ./data/chrome-81:/config
```

## 4. Reference

- https://github.com/linuxserver/docker-baseimage-kasmvnc
