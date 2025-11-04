#!/bin/bash

dockerfile=$(find . -maxdepth 1 -name "Dockerfile.*" -type f -printf "%f\n" | sort -r | fzf --height 40% --layout reverse)
chrome_version=${dockerfile##*_}
image_name="gitsang/chrome:${chrome_version}-$(date +%Y%m%d)"
rolling_image_name="gitsang/chrome:${chrome_version}-$(date +%Y%m%d)"

docker build -f "${dockerfile}" -t "${image_name}" .
docker tag "${image_name}" "${rolling_image_name}"
docker push "${image_name}"
docker push "${rolling_image_name}"
