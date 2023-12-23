[English](./readme.md) | 中文

[Dragonwell](https://github.com/dragonwell-project)的Docker镜像

修改自 [dragonwell-project/droganwell-containers](https://github.com/dragonwell-project/dragonwell-containers/)

# 区别

- 使用 `jlink`在构建时生成JRE
    - 对于Java 8, 使用 `/jre` 目录下的JRE
- 删除了构建时安装的非必须软件包, 如 `curl`, `wget`
- 弃用Java EE支持
- 镜像大小大幅缩减

# 比较

使用 [`ubuntu:22.04`](https://hub.docker.com/layers/library/ubuntu/22.04/images/sha256-bbf3d1baa208b7649d1d0264ef7d522e1dc0deeeaaf6085bf8e4618867f03494?context=explore) 和 [`Dragonwell 17.0.9`](https://github.com/dragonwell-project/dragonwell17/releases/tag/dragonwell-standard-17.0.9.0.10%2B9_jdk-17.0.9-ga) 构建

|原版本   |修改版  |区别    |
|--------|--------|--------|
|457M    |264M    |-42.23% |

# 声明

使用镜像可能会遇到一些难以预料的问题，遇到问题时请优先尝试在[dragonwell-project/droganwell-containers](https://github.com/dragonwell-project/dragonwell-containers/)复现，以确定应该在哪里提交issue