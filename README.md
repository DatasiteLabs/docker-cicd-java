# docker-cicd-java


[![Docker](https://github.com/DatasiteLabs/docker-cicd-java/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/DatasiteLabs/docker-cicd-java/actions/workflows/docker-publish.yml) ![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/DatasiteLabs/docker-cicd-java?sort=semver)

alpine based docker container with java installed. also has: gradle, jfrog...

## updating

1. change the VERSION file text to your target version to avoid clobbering existing versions. [see versions](#versions)

## Opening a PR

* Use a meaningful title, it will be used as the release title
* Use a meaningful commit message, it will be used as the release message

## versions

Manually versioned and latest stored in VERSION file. See https://gradle.org/releases/ for gradle releases. Version should likely match your build.gradle or gradle wrapper settings.

> If you need to amend the version in between, use '-blah' or '-fix-blah', the hyphen will break the gradle version from arbitrary information. e.g. -jfrog-1.32.3

## Testing Locally

1. Run `./build.sh`
1. Run `./test.sh`
