FROM java:7
MAINTAINER Steven Jack <stevenmajack@gmail.com>

RUN apt-get -y update

RUN apt-get -y install curl
RUN mkdir -p /var/data/local-dynamo/data
RUN curl http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest -L -O
RUN tar -zxvf dynamodb_local_latest -C /var/data/local-dynamo

EXPOSE 4570

ENTRYPOINT ["java", "-Djava.library.path=/var/data/local-dynamo/DynamoDBLocal_lib", "-jar", "/var/data/local-dynamo/DynamoDBLocal.jar", "-port", "4570"]
