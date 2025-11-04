dockerfiles=$(find . -maxdepth 1 -name "Dockerfile.*" -type f -printf "%f\n")

for dockerfile in ${dockerfiles}; do
  ./build.sh "${dockerfile}"
done
