FROM ubuntu:22.04

# Installs
RUN apt-get update  \
    && apt install -y openssh-server cron vim doas

# SSH
RUN adduser --disabled-password --gecos "" user
RUN groupadd sshgroup && usermod -aG sshgroup user && mkdir /var/run/sshd
RUN echo 'root:N0tRequ1r3d' | chpasswd && echo 'user:V@nyaUv01eN' | chpasswd
COPY ./sshd_config /etc/ssh/sshd_config
RUN mkdir /home/user/.ssh \
    && echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhZgdSFMi+HwijNU1bQBCJN1ecF7AeZ4/YoALdNQ8mTDITP15Y3Ld5jb2ZIelZ+20QQEdwImQKyNMJDhBduIh6Xz+J9C1b2NLEA6nK1gU/+HR1R+fJ6O3OShVxV9/ItJrPEb+rY/P7OK6Feyi8p7UXgH1M8I7RsJJNQ69XiAoJbaO5+jCQPG2EqDgBBSzLGLf05KE3OyOOnNROEqnyZHX/HC6frgtZGMfNm3Hk+aEkIoRI8Pag0HQAphnBdIcJzokjfAVmzoDT+3EjhkXXec/1mUd4ckD1aJ3MMnx2h8fJHp9lIl9EjNcX+YJaISoX1BdCwbWihAhfRv27ZTnWd9JQ0bj6wVj4WfGDjIODOVrx0EB6dlbpBAOvczXxpG8BeYRSBBjy1mW5cDjZQr96ZB0rp2j8P8oTf3H9VFXQV0fOilZOVYlspXnLG2RdpDEjV//KUpkNDCgfAQOcEh/VKUaQZV+PxR4DpBB+y4Qtw6nqSxr6TnnEslZ/3vz3TOieis8= kali@kali' > /home/user/.ssh/authorized_keys \
    && service ssh start 

# Cron 
RUN adduser --disabled-password --gecos "" cronuser && (echo 'cronuser:11111' | chpasswd )

# Doas
RUN echo "permit nopass user as cronuser cmd crontab args -e" > /etc/doas.conf

# General
RUN chmod u-s $(which passwd)
RUN mkdir -p /var/taskvolume && echo "mctf{cR0n_F1ag_L3aK}" > /var/taskvolume/flag 

# Startup
EXPOSE 22
COPY ./entrypoint.sh ./root/entrypoint.sh 
ENTRYPOINT ["/root/entrypoint.sh"]
