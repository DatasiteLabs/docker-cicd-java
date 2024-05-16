FROM --platform=$BUILDPLATFORM gradle:7.6.4-jdk11-jammy
ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETARCH
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM with $TARGETARCH"

LABEL version="1.2" maintainer="Kayla Altepeter"
ENV GH_CLI_VERSION 2.43.1

RUN curl -fL https://getcli.jfrog.io | sh \
    && mv ./jfrog /usr/local/bin/jfrog \
    && chmod 777 /usr/local/bin/jfrog

RUN <<EOF
    set -eux
    apt-get update
    apt-get install --assume-yes --no-install-recommends wget
    mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
    chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    apt-get update
    apt-get install --assume-yes --no-install-recommends dumb-init \
    nodejs \
    npm \
    gnupg2 \
    unzip \
    jq \
    vim-tiny \
    curl \
    git \
    gh  \
    python3

    rm -rf /var/lib/apt/lists/*
    apt-get clean
EOF

USER gradle
VOLUME /home/gradle

RUN cat <<EOF
Version Info:

java     $(java --version)
gradle   $(gradle --version)
node     $(node --version)
npm      $(npm --version)
gh cli   $(gh --version)
git      $(git --version)
jfrog    $(jfrog --version)
EOF

EXPOSE 8080
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["gradle"]
