FROM ghcr.io/ublue-os/fedora-toolbox:latest@sha256:c0be55c6cad4ddcbda256c1a29d1da62b4feba8c3551279afc2bca72813fcfa2

LABEL com.github.containers.toolbox="true" \
    usage="This image is meant to be used with the toolbox or distrobox command" \
    summary="A cloud-native terminal experience" \
    maintainer="27022259+auricom@users.noreply.github.com"

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm && \
	mv /usr/bin/sudo /usr/bin/sudo_bak && \
    curl -fsSL https://get.jetpack.io/devbox -o /tmp/install-devbox.sh && chmod +x /tmp/install-devbox.sh && /tmp/install-devbox.sh -f && \
	mv /usr/bin/sudo_bak /usr/bin/sudo && \
    chown --recursive 1001 /nix /usr/local/bin/devbox && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker
