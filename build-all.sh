dockerfiles=$(find . -maxdepth 1 -name "Dockerfile.*" -type f -printf "%f\n" | sort -V)

for dockerfile in ${dockerfiles}; do
  ./build.sh "${dockerfile}"
done
