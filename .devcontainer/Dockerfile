FROM rocker/r-ver:4.5.2

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV RENV_CONFIG_PAK_ENABLED=TRUE
ENV RENV_PATHS_LIBRARY=renv/library

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean && \
    apt-get update && apt-get install -y \
    git \
    vim \ 
    curl \
    cmake \
    gdal-bin \
    libgdal-dev \
    libudunits2-dev \
    libx11-dev \
    ca-certificates \
    xz-utils \
    libfontconfig1-dev \
    libfreetype6-dev \ 
    libcairo2-dev \
    pandoc \
    libglpk-dev \ 
    libgit2-dev \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

RUN curl --proto '=https' --tlsv1.2 -LsSf https://github.com/eitsupi/arf/releases/latest/download/arf-console-installer.sh | sh

# COPY .bashrc /root/.bashrc
COPY . .
    
