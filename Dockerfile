FROM openjdk:17-jdk-alpine3.14
LABEL NAME="Argela ONAP API"
LABEL AUTHORS="Nebi UNLENEN <unlenen@gmail.com>"

RUN apk add tzdata ;  cp /usr/share/zoneinfo/Etc/GMT-3 /etc/localtime ; echo 'Etc/GMT-3' > /etc/timezone   ;  date 

RUN mkdir -p /opt/argela
ADD onap-rest/target/onap-rest-1.0.jar /opt/argela/onap-rest-1.0.jar

#Entrypoint
ADD entrypoint.sh /opt/argela/entrypoint.sh
RUN chmod +x /opt/argela/entrypoint.sh
ENTRYPOINT [ "sh", "-c", "/opt/argela/entrypoint.sh" ]
