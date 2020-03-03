FROM gradle:6.2.1-jdk11
LABEL version="1.1" maintainer="Kayla Altepeter"

COPY --from=jfrog-docker-reg2.bintray.io/jfrog/jfrog-cli-go:1.32.3 /usr/local/bin/jfrog /usr/local/bin/jfrog

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get update && apt-get install -y --no-install-recommends \
    vim \
    python3 \
    jq \
    unzip \
    curl \
    nodejs

# install dumb-init
# https://engineeringblog.yelp.com/2016/01/dumb-init-an-init-for-docker.html
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["dumb-init", "--"]
CMD ["gradle"]