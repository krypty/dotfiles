#!/usr/bin/env bash
# set -e

function docker_sudo_exec() {
  docker exec -it -u root:root clion $@
}

function docker_exec() {
  docker exec -it -u $(id -u):$(id -g) clion $@
}

docker_sudo_exec "/usr/bin/apt-get update"
docker_sudo_exec "/usr/bin/apt-get install -y stow"
docker_sudo_exec "chmod 777 /home/gary/"

docker_exec "/usr/bin/git clone https://github.com/krypty/dotfiles.git /home/gary/dotfiles"

docker_exec "/usr/bin/stow -v -t /home/gary -d /home/gary/dotfiles/ vim"

./run-in-docker.sh $@
