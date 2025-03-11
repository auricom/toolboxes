FROM ghcr.io/ublue-os/fedora-toolbox:latest@sha256:0eceac1b9f21ca35c326f01858a212a51d06b33a202e55185eb9842e395b9feb

LABEL com.github.containers.toolbox="true" \
    usage="This image is meant to be used with the toolbox or distrobox command" \
    summary="A cloud-native terminal experience" \
    maintainer="27022259+auricom@users.noreply.github.com"

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm && \
	mv /usr/bin/sudo /usr/bin/sudo_bak && \
    curl -fsSL https://get.jetpack.io/devbox -o /tmp/install-devbox.sh && chmod +x /tmp/install-devbox.sh && /tmp/install-devbox.sh -f && \
	mv /usr/bin/sudo_bak /usr/bin/sudo && \
    chown --recursive 1000 /nix /usr/local/bin/devbox && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker
