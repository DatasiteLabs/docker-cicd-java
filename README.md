# docker-cicd-java


[![Docker](https://github.com/DatasiteLabs/docker-cicd-java/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/DatasiteLabs/docker-cicd-java/actions/workflows/docker-publish.yml) ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/DatasiteLabs/docker-cicd-java?sort=semver)

## Toolchain

- GitHub CLI
- Java
- Groovy
- Gradle
- Nodejs
- Python
- Dumb Init
- JFrog

## Base container / toolchain info

This container is based off of: <https://hub.docker.com/_/python> and also adds poetry.

List of install resources used:

- <https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt>
- <https://github.com/Yelp/dumb-init?tab=readme-ov-file#option-1-installing-from-your-distros-package-repositories-debian-ubuntu-etc>

## updating

1. change the VERSION file text to your target version to avoid clobbering existing versions. [see versions](#versions)

## Opening a PR

* Use a meaningful title, it will be used as the release title
* Use a meaningful commit message, it will be used as the release message

## versions

Manually versioned and latest stored in VERSION file. See https://gradle.org/releases/ for gradle releases. Version should likely match your build.gradle or gradle wrapper settings.

> If you need to amend the version in between, use '-blah' or '-fix-blah', the hyphen will break the gradle version from arbitrary information. e.g. -jfrog-1.32.3

## Local Testing

To use the build scripts, use docker buildx with multiplatform.

Create a builder

```bash
docker buildx create \
  --name container \
  --driver=docker-container
```

Setup a local registry

```bash
./local_registry.sh
```

Run the scripts

The localdomain can't be localhost, 0.0.0.0, 127.0.0.1 or others on the insecure repository list, port is 5001.

Use: 'host.docker.internal'

Run docker info to see list.

```bash
# ./build.sh <platforms> <localdomain:port>
./build.sh linux/arm64 host.docker.internal:5001 # to pass in a local domain, edit hostsfile
```

If you get `http: server gave HTTP response to HTTPS client` the easy solution is to run a tool like ngrok `ngrok http 5001` and run `./build.sh linux/arm64 <ngrok_https_host>`. Replace `<ngrok_https_host>` with yours ngrok hostname ending in `.ngrok-free.app` without the protocol.

This will give you an https path locally (and externally, shutdown when done).


### Run

```bash
# ./run.sh <localdomain:port>
./run.sh host.docker.internal:5001
```

### Test

```bash
# ./build.sh <localdomain:port>
./test.sh host.docker.internal:5001
```

## Generating the Test App

```bash
cd test
gradle init --type java-application  --dsl groovy
```
