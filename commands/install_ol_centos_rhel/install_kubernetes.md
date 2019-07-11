# Installation on Oracle Linux 7.6
---
    sudo -s
---
    cat <<EOF > /etc/yum.repos.d/kubernetes.repo
    [kubernetes]
    name=Kubernetes
    baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
    enabled=1
    gpgcheck=1
    repo_gpgcheck=1
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    exclude=kube*
    EOF
---
    setenforce 0
---
    sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
---
    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes 
(OR version specific)
    
    yum install -y kubelet-1.13.8 kubeadm-1.13.8 kubectl-1.13.8 --disableexcludes=kubernetes
---
    systemctl enable --now kubelet
---
    modprobe br_netfilter
---
    cat <<EOF >  /etc/sysctl.d/k8s.conf
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    EOF
---
    sysctl --system
---
    sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
---
    swapoff -a

# Stating Master
---
    kubeadm init --pod-network-cidr=192.168.0.0/16  
---
    mkdir -p $HOME/.kube
--- 
    cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
---
    chown $(id -u):$(id -g) $HOME/.kube/config
---
    kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
---
    kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

    
# Starting Worker Node
---
    kubeadm join 10.0.20.9:6443 --token ktek1m.zrq4q1rv47qkcpid --discovery-token-ca-cert-hash sha256:3e75d3a043c2ac7904ed6a3462d09a42ee9c8f66f28bb3befa30879bcd0932f0