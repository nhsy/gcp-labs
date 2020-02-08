#!/bin/bash -xe

# output to log file
exec >> /var/log/bootstrap.log 2>&1

echo "metadata_start"

curl -sLO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version --client=true

yum install -y git htop privoxy
sed -i 's/listen-address  127.0.0.1:8118/listen-address  0.0.0.0:8118/' /etc/privoxy/config
systemctl enable privoxy
systemctl start privoxy
yum update -y

echo "metadata_end"
