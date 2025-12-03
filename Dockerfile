# 多阶段构建，根据TARGETARCH选择不同的基础镜像
ARG TARGETARCH

# 为不同架构定义不同的基础镜像阶段
FROM scottyhardy/docker-wine:latest as amd64-base
FROM tobix/wine:test-arm64 as arm64-base

# 根据目标架构选择正确的基础镜像
FROM ${TARGETARCH}-base

COPY png2slg/tools /usr/local/png2slg

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-21-jdk curl && \
    apt-get clean && \
    wineboot --init && \
    rm -rf \
    /tmp/* \
    /usr/share/doc/* \
    /var/cache/* \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /var/log/*

# 去掉原镜像的 entrypoint 和 cmd
ENTRYPOINT []
CMD []