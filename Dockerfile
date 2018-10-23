FROM amazonlinux:2017.03

RUN yum update -y
RUN yum install python36 python36-virtualenv python36-pip zip -y

VOLUME /app

CMD ["sleep", "infinity"]
