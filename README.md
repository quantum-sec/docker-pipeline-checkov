![Managed Security Platform Infrastructure by Quantum](.docs/readme-header.svg)

# docker-pipeline-checkov

[![Build Status][build_badge_image]][build_badge_link]
[![License][license_badge_image]][license_badge_link]
[![quantumsec/docker-pipeline-checkov][docker_badge_image]][docker_badge_link]
[![Maintained by quantum.security][maintained_badge_image]][maintained_badge_link]


This repository contains the container runtime environment for using Quantum's
[ci-analysis-collector utility](https://github.com/quantum-sec/ci-analysis-collector) with
[Checkov](https://github.com/bridgecrewio/checkov).

## Usage

```bash
docker pull quantumsec/docker-pipeline-checkov

docker run \
  -e QS_API_TOKEN \
  -v "$PWD":"/workspace":ro \
  quantumsec/docker-pipeline-checkov \
  npx --yes --package '@quantum-sec/ci-analysis-collector' --call 'ci-analysis-collector checkov --path /workspace'
```

In the above example, you may use the `-e` argument to pass the `QS_API_TOKEN` environment variable from the current
environment, and the `-v` argument to mount the code to be scanned as a read-only volume to the `/workspace` directory.

Additionally, you can modify `npx`'s `--call` argument to pass additional configuration options described in the
[documentation](https://github.com/quantum-sec/ci-analysis-collector#arguments).

## Code of Conduct

Help us keep this project open and inclusive. Please read and follow our Code of Conduct.

## License

This code is released under the Apache 2.0 License.

[build_badge_image]:https://dev.azure.com/quantum-sec/Quantum/_apis/build/status/quantum-sec.docker-pipeline-checkov?repoName=quantum-sec%2Fdocker-pipeline-checkov&branchName=master
[build_badge_link]:https://dev.azure.com/quantum-sec/Quantum/_build/latest?definitionId=88&repoName=quantum-sec%2Fdocker-pipeline-checkov&branchName=master
[license_badge_image]:https://img.shields.io/badge/License-Apache--2.0-008cda
[license_badge_link]:./LICENSE
[docker_badge_image]:https://img.shields.io/docker/v/quantumsec/docker-pipeline-checkov?color=008cda
[docker_badge_link]:https://hub.docker.com/repository/docker/quantumsec/docker-pipeline-checkov
[maintained_badge_image]:https://img.shields.io/badge/maintained%20by-quantum.security-00da55
[maintained_badge_link]:https://www.quantum.security?utm_source=github&utm_medium=organic_oss&utm_campaign=ci-analysis-collector
