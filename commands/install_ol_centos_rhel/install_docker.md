Installing on Oracle Linux 7.6
---
    sudo -s
---
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
---
    yum install -y docker-ce docker-ce-cli containerd.io
---
    systemctl start docker
---
    systemctl enable docker.service