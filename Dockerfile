ARG BASE_IMAGE

FROM ${BASE_IMAGE}

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