FROM scratch AS ctx
COPY build_files /

FROM ghcr.io/ublue-os/akmods-nvidia-open:main-43 AS nvidia-kernel
FROM ghcr.io/bazzite-org/nvidia-drivers:latest-f43-x86_64 AS nvidia-packages

FROM quay.io/fedora/fedora-bootc:43

RUN rm -r /opt && mkdir /opt

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=bind,from=nvidia-kernel,source=/,target=/nvidia-kernel \
    --mount=type=bind,from=nvidia-packages,src=/,dst=/nvidia-packages \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN bootc container lint
