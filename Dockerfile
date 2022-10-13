ARG DOCKER_REG=nexus-ci.corp.dev.vtb/sgbp_sska-docker-lib
FROM ${DOCKER_REG}/openjdk-8-runtime:1.14-3.1661798360

ENV _JAVA_OPTIONS="-Xms128m -Xmx1024m -Dfile.encoding=utf-8"
ENV SSKA_SPRING_PROFILES_ACTIVE="prod"
COPY ./target/gosuslugi-sgbp-sska-dictionary*.jar /gosuslugi-sgbp-sska-dictionary.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-jar","/gosuslugi-sgbp-sska-dictionary.jar", "--spring.profiles.active=${SSKA_SPRING_PROFILES_ACTIVE}"]