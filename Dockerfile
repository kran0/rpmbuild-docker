FROM fedora:28

ENV USER=dummy UID=100 HOMEDIR=/work

RUN dnf -y groupinstall "Development Tools" "Legacy Software Development"\
 && dnf -y install sudo rpm-build dnf-plugins-core m4 glib2-devel cmake gcc-c++

RUN echo "$USER ALL=(ALL) NOPASSWD: /usr/bin/dnf" >> /etc/sudoers
RUN useradd -c "RPM builder" -d $HOMEDIR -m -u $UID $USER

USER $USER

ADD entrypoint /
ENTRYPOINT [ "/entrypoint" ]
CMD [ "SPECS/*.spec" ]