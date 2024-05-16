ARG DOCKER_REPO
FROM ${DOCKER_REPO}/datasite/test-cicd-java:latest-java

RUN echo "current user:   $(whoami)" && \
    echo "current gradle: $(gradle -v)" && \
    echo "current java:   $(java -v)" && \
    echo "current groovy: $(groovy -v)"

COPY --chown=gradle ./ /home/gradle/test
WORKDIR /home/gradle/test

USER gradle

ENTRYPOINT [ "bash", "-c", "gradle build" ]
