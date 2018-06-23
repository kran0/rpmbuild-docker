FROM fedora:28

RUN dnf -y groupinstall "Development Tools" "Legacy Software Development"\
 && dnf -y install rpm-build dnf-plugins-core\
                   m4 glib2-devel cmake gcc-c++ # most used depencies

ADD entrypoint /

ENTRYPOINT [ "/entrypoint" ]
CMD [ "SPECS/*.spec" ]