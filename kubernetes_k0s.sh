#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl

sudo mv kubectl /bin

echo 'source <(kubectl completion bash)' >>~/.bashrc

wget https://github.com/k0sproject/k0sctl/releases/download/v0.19.4/k0sctl-linux-amd64

mv k0sctl-linux-amd64 k0sctl

sudo chmod +x k0sctl

sudo mv k0sctl /bin

echo 'source <(k0sctl completion bash)' >>~/.bashrc

# Archivo a crear
CLUSTER_FILE="cluster.yaml"

# Contenido del archivo
# Modificar ips de acuerdo a instancias
cat <<EOF > $CLUSTER_FILE
apiVersion: k0sctl.k0sproject.io/v1beta1
kind: Cluster
metadata:
  name: ticveintitres-cluster-ubuntu
spec:
  hosts:
  - role: controller
    privateAddress: 172.31.83.194
    privateInterface: enX0
    installFlags:
    - --debug
    ssh:
      address: 172.31.83.194
      user: ubuntu
      port: 22
      keyPath: ~/.ssh/id_rsa
  - role: worker
    privateAddress: 172.31.94.110
    privateInterface: enX0
    ssh:
      address: 172.31.94.110
      user: ubuntu
      port: 22
      keyPath: ~/.ssh/id_rsa
EOF
# Mensaje de confirmación
echo "El archivo $CLUSTER_FILE ha sido creado con éxito."

