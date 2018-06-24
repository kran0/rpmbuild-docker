FROM fedora:28

ENV USER=dummy UID=100 HOMEDIR=/home/dummy

RUN dnf -y groupinstall "Development Tools" "Legacy Software Development"\
 && dnf -y install sudo rpm-build dnf-plugins-core m4 glib2-devel cmake gcc-c++\

# Allow $USER to use 'dnf'
 && echo "$USER ALL=(ALL) NOPASSWD: /usr/bin/dnf" >> /etc/sudoers\

 && useradd -c "RPM builder" -d $HOMEDIR -m -u $UID $USER\
 && chmod 777 $HOMEDIR

USER $USER

ADD entrypoint /
ENTRYPOINT [ "/entrypoint" ]
CMD [ "SPECS/*.spec" ]