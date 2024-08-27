FROM ghcr.io/ublue-os/fedora-distrobox:latest@sha256:a02a21354fda9fefa740b10a598f0dc884c03937943569efdce34b7cab44014a

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
