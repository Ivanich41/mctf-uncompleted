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
    && echo ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD4JkpGL8WyGguNzUI6dNlTLEG1loCwAu4QhtDSLYSaZq+5uN6yRJcd7PVZ0gFRFFYGmhn9VFsSwSx37qn9Gl5evcHxVEjHGY1Z1VGDImXOQEz97/n7x+DmFKMvX5uXBh7D6rxFxDy8BCrjzPoLuz2fC1DLUqqVJSssBfdSxNHaENaVwsQ2T2HDCU61cnvacke/tFLCvp3LjAIR05mPPSzTTLBTDcrKxZEc4JNDMeu309szh0I65QJw5kQE72+3fVV92KbV3hQoz1hWhaQy/cemDlu8zQTA5zXIFXdfqP3A11CnOXabKhca1Vcy7fxpUb9gqvMed/NbphJ4HDgppBj/htc+vkH/cLF6htXKL4490VVRGOqLs56KiFr8iI9wN4u2v2M/jb/PHmIBQSxQtW1klJ7rNp69K+qyaWVXk13d9H03a+iTYKFPBmgD25jOZv79AsDzXa+Us/oaicmnjv9aDmM16LLxSMz0WJnrpeIzGU39NKtu6zhhrdahAFKx5q0= kali@kali > /home/user/.ssh/authorized_keys \
    && service ssh start 
# Key would be replaced to encrypted

# Cron 
RUN adduser --disabled-password --gecos "" cronuser && (echo 'cronuser:W0r1d0F1LLu51oN' | chpasswd )

# Doas
RUN echo "permit nopass user as cronuser cmd crontab args -e" > /etc/doas.conf

# General
RUN chmod u-s $(which passwd)
RUN echo "mctf{cR0n_F1@g_L3aK}" > /home/cronuser/.flag && chown root:cronuser /home/cronuser/ \
    && chmod 1775 /home/cronuser/ && chown root /home/cronuser/.flag 

# Startup
EXPOSE 22
COPY ./entrypoint.sh /root/entrypoint.sh 
ENTRYPOINT ["/root/entrypoint.sh"]
