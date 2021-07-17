# bootstrap

```bash
#!/bin/bash
apt update ; apt install git
git clone https://github.com/r4b2/bootstrap.git /opt/bootstrap >> /var/log/bootstrap.log 2>&1;
bash /opt/bootstrap/basic.sh >> /var/log/bootstrap.log 2>&1;
```