FROM taf7lwappqystqp4u7wjsqkdc7dquw/heavytombstone
MAINTAINER “Emory Merryman” emory.merryman+DoTDeCocXJroqaWu@gmail.com>
USER root
RUN dnf update --assumeyes && dnf install --assumeyes sudo gnome-terminal dbus && dnf update --assumeyes && dnf clean all
RUN dbus-uuidgen > /var/lib/dbus/machine-id
RUN echo "${LUSER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${LUSER} && chmod 0444 /etc/sudoers.d/${LUSER}
USER ${LUSER}
RUN locale-gen --purge
CMD /usr/bin/gnome-terminal
