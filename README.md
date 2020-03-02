# docker-cicd-java

[![Docker Build Status](https://img.shields.io/docker/build/merrillcorporation/docker-cicd-java.svg?style=for-the-badge)](https://hub.docker.com/r/merrillcorporation/docker-cicd-java/builds/)

alpine based docker container with java installed. also has: gradle, jfrog...

## updating

1. change the VERSION file text to your target version to avoid clobbering existing versions. [see versions](#versions)

## Opening a PR

* Use a meaningful title, it will be used as the release title
* Use a meaningful commit message, it will be used as the release message

## versions

Manually versioned and latest stored in VERSION file. See https://gradle.org/releases/ for gradle releases. Version should likely match your build.gradle or gradle wrapper settings.

> If you need to amend the version in between, use '-blah' or '-fix-blah', the hyphen will break the gradle version from arbitrary information. e.g. -jfrog-1.32.3