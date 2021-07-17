# bootstrap

```bash
#!/bin/bash
apt update >> /var/log/bootstrap.log 2>&1;
apt install -y git >> /var/log/bootstrap.log 2>&1;
git clone https://github.com/r4b2/bootstrap.git /opt/bootstrap >> /var/log/bootstrap.log 2>&1;
bash /opt/bootstrap/basic.sh >> /var/log/bootstrap.log 2>&1;
```