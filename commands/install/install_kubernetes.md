# Installing Kubernetes on Ubuntu 18.04 LTS
These instructions are taken from this page https://v1-14.docs.kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/


### Installing Kubeadm Kubelet and Kubectl (On all VMs)

`curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`

`sudo add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"`

`sudo apt-get update`

`sudo apt-get install -y kubelet kubeadm kubectl`


### Starting a Master

`sudo kubeadm init --pod-network-cidr=192.168.0.0/16`

`mkdir -p $HOME/.kube`

`sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`

`sudo chown $(id -u):$(id -g) $HOME/.kube/config`


### Applying RBAC and pod-network to Master

`kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml`

`kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml`


### Adding a worker node to master

`sudo kubeadm join --token <token> <master-ip>:<master-port> --discovery-token-ca-cert-hash sha256:<hash>`
e.g. `sudo kubeadm join 10.128.0.39:6443 --token bc2ezt.y3n703enfzjv681n --discovery-token-ca-cert-hash sha256:a4f7a3ce43cae1cccf2a442deb285aef0877c0e14a3c0ef913f0cdf5af0f7c8a`

PS: If you miss to note the token then use following command to list tokens
`kubeadm token list`

PS: After 24 hrs tokens expired. Use following command to re-generate them.
`kubeadm token create`