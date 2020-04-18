#!/bin/sh
set -eu
imagename=nginx-rpm

usage() {
  cat <<'EOF' 1>&2
Usage: wrapper.sh subcommand args...

subcommands:
  build            build the docker image with tag "$imagename"
  run              run the docker image of tag "$imagename"
  bash             run /bin/bash in the docker image of tag "$imagename"
EOF
}

case "${1:-}" in
build)
  docker build -t $imagename .
  ;;
run)
  docker run --rm -it --mount type=bind,source="$(pwd)"/RPMS,target=/home/builder/rpmbuild/RPMS $imagename
  ;;
bash)
  docker run --rm -it $imagename /bin/bash
  ;;
*)
  usage
  ;;
esac
