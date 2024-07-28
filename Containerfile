FROM ghcr.io/ublue-os/fedora-distrobox:latest@sha256:4018e8971cb31522f197bac13c2c77c3e1f2945d9aeae75fecb77732ca4bbbc9

LABEL com.github.containers.toolbox="true" \
    usage="This image is meant to be used with the toolbox or distrobox command" \
    summary="A cloud-native terminal experience" \
    maintainer="27022259+auricom@users.noreply.github.com"

ADD ./docker-socket-permissions.service /etc/systemd/system

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm && \
	curl -fsSL https://get.jetpack.io/devbox -o /tmp/install-devbox.sh && chmod +x /tmp/install-devbox.sh && /tmp/install-devbox.sh -f && \
	chown --recursive 1000 /nix /usr/local/bin/devbox && \
    sudo systemctl enable docker-socket-permissions.service && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker
