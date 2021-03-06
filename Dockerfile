FROM taf7lwappqystqp4u7wjsqkdc7dquw/heavytombstone
MAINTAINER “Emory Merryman” emory.merryman+DoTDeCocXJroqaWu@gmail.com>
USER root
RUN dnf update --assumeyes && dnf install --assumeyes sudo passwd byobu dbus && dnf update --assumeyes && dnf clean all
RUN dbus-uuidgen > /var/lib/dbus/machine-id
RUN echo "${LUSER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${LUSER} && chmod 0444 /etc/sudoers.d/${LUSER}
VOLUME /opt/grimcreek/private
VOLUME /opt/grimcreek/input
VOLUME /opt/grimcreek/output
RUN chmod 0555 /opt/grimcreek/private /opt/grimcreek/input && chmod 0777 /opt/grimcreek/private
USER ${LUSER}
CMD /usr/bin/byobu
