FROM taf7lwappqystqp4u7wjsqkdc7dquw/heavytombstone
MAINTAINER “Emory Merryman” emory.merryman+DoTDeCocXJroqaWu@gmail.com>
USER root
RUN dnf update --assumeyes && dnf install --assumeyes sudo passwd byobu dbus && dnf update --assumeyes && dnf clean all
RUN dbus-uuidgen > /var/lib/dbus/machine-id
RUN usermod -a ${LUSER} -G wheel && echo "D7xK6v4Z" | passwd --stdin ${LUSER}
USER ${LUSER}
CMD /usr/bin/byobu
