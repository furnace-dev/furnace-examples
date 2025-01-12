# 使用 Ubuntu 24.04 作为基础镜像
FROM ubuntu:24.04

# 设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表并安装必要的包
RUN apt-get update && \
    apt-get install -y \
    zlib1g-dev \
    libtinfo-dev \
    libncurses-dev \
    clang \
    build-essential \
    curl \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 克隆 GitHub 仓库
RUN git clone https://github.com/furnace-dev/furnace-examples.git /furnace-examples

# 安装 Magic
RUN curl -ssL https://magic.modular.com/deb11e15-6af4-4a50-b5ee-ee560fd0ddec | bash

# 设置环境变量
ENV PATH="/usr/local/bin:${PATH}"

# 检查 Magic 版本
CMD ["magic", "--version"]
