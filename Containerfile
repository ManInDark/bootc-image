FROM scratch AS ctx
COPY build_files /

FROM ghcr.io/ublue-os/akmods-nvidia:main-42 AS nvidia

FROM ghcr.io/ublue-os/base-main:42

RUN rm -r /opt && mkdir /opt

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=bind,from=nvidia,source=/,target=/nvidia \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=bind,from=nvidia,source=/,target=/nvidia \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/nvidia.sh

RUN bootc container lint
