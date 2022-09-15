FROM datasite/test-cicd-java:latest

RUN echo "current user: $(whoami)" && \
    echo "current node: $(node -v)" && \
    echo "current npm:  $(npm -v)"

COPY --chown=gradle ./ /home/gradle/test
WORKDIR /home/gradle/test

ENTRYPOINT [ "bash", "-c", "ls -la;" ]