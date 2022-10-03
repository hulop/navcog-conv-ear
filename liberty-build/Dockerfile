FROM websphere-liberty:21.0.0.12-full-java8-ibmjava
ARG app

COPY config/server.xml /config
COPY config/jvm.options /config
COPY ${app} /config/dropins/

RUN installUtility install --acceptLicense defaultServer
