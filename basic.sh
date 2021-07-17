#!/bin/bash
HOME=/root/

cd $HOME || exit

apt update
apt dist-upgrade -y
apt install -y vim htop bmon jq curl

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
AWS_REGION=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r ".region")

wget "https://s3.${AWS_REGION}.amazonaws.com/amazon-ssm-${AWS_REGION}/latest/debian_amd64/amazon-ssm-agent.deb" -O /tmp/amazon-ssm-agent.deb
dpkg -i /tmp/amazon-ssm-agent.deb
systemctl enable --now amazon-ssm-agent

ln -s /opt/bootstrap/vimrc /home/admin/.vimrc
ln -s /opt/bootstrap/vimrc /root/.vimrc

#shutdown -r now