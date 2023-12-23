English | [中文](./readme_CN.md)

Docker image for [Dragonwell](https://github.com/dragonwell-project), a downstream version of OpenJDK.

Modifided from [dragonwell-project/droganwell-containers](https://github.com/dragonwell-project/dragonwell-containers/)

## Differences

- Generate JRE for image build, using `jlink`
    - For Java 8, use `/jre` folder instead
- Removed unnecessary package installed during build process, like `curl`, `wget`
- Removed Java EE builds
- Has a much smaller size

## Comparison

Built with [`ubuntu:22.04`](https://hub.docker.com/layers/library/ubuntu/22.04/images/sha256-bbf3d1baa208b7649d1d0264ef7d522e1dc0deeeaaf6085bf8e4618867f03494?context=explore) and [`Dragonwell 17.0.9`](https://github.com/dragonwell-project/dragonwell17/releases/tag/dragonwell-standard-17.0.9.0.10%2B9_jdk-17.0.9-ga)

|Original|Modified|Diff    |
|--------|--------|--------|
|457M    |264M    |-42.23% |

## Disclaimer
Using this mirror may encounter some unforeseen problems. If you encounter any, please try to reproduce them on [dragonwell-project/droganwell-containers](https://github.com/dragonwell-project/dragonwell-containers/) first to determine where the issue should be submitted.