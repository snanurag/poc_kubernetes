# Installing Kubernetes on Ubuntu 18.04 LTS

### Installing Kubeadm Kubelet and Kubectl

`curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`

`sudo add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"`

`sudo apt-get update`

`sudo apt-get install -y kubelet kubeadm kubectl`
