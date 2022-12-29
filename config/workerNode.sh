#!/bin/bash
USERNAME="ubuntu"
HOME="/home/$USERNAME"


variables() {
  PODMAN_TARBALL="podman-linux-amd64.tar.gz"
}

# Deploy a Worker Node
worker() {
  wget ${URL} --user=${USER} --password=${PASSWORD} -O "$HOME/LFD259_SOLUTIONS.tar.xz" &&
  tar -xvf "$HOME/LFD259_SOLUTIONS.tar.xz" -C $HOME &&
  bash "$(find / -name k8sWorker.sh 2>/dev/null)" | tee "$HOME/worker.out"
}

# Download and install podman
install_podman() {
  curl -fsSL -o $PODMAN_TARBALL https://github.com/mgoltzsche/podman-static/releases/latest/download/$PODMAN_TARBALL
  tar -xf $PODMAN_TARBALL
  sudo cp -r podman-linux-amd64/{usr,etc} /
}

setalias() {
  echo "alias k="kubectl"" >> "$HOME/.bashrc"
}

main() {
  worker &&
  variables &&
  setalias
  # install_podman
}

main