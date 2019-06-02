# Installing Kubernetes on Ubuntu 18.04 LTS


### Installing Kubeadm Kubelet and Kubectl

`curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`

`sudo add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"`

`sudo apt-get update`

`sudo apt-get install -y kubelet kubeadm kubectl`


### Starting a cluster

`sudo kubeadm init --pod-network-cidr=192.168.0.0/16`

`mkdir -p $HOME/.kube`

`sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`

`sudo chown $(id -u):$(id -g) $HOME/.kube/config`


### Applying RBAC and pod-network

`kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml`

`kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml`
