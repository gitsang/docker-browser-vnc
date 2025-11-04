#!/bin/bash

dockerfile=${1}
if [ -z "${dockerfile}" ]; then
  dockerfile=$(find . -maxdepth 1 -name "Dockerfile.*" -type f -printf "%f\n" | sort -r | fzf --height 40% --layout reverse)
fi

browser_name=${dockerfile#*.}
browser_name=${browser_name%_*}
browser_version=${dockerfile##*_}
image_name="gitsang/browser-vnc:${browser_name}-${browser_version}"

echo "build image: ${image_name}"

# shellcheck disable=SC2068
docker build -f "${dockerfile}" -t "${image_name}" ${@} .
docker push "${image_name}"
