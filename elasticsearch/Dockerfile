ARG ELK_VERSION

FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}

RUN yum update -y && \
    yum install vim htop net-tools -y