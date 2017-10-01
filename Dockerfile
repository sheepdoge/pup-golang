FROM python:2.7

RUN apt-get update -qq
RUN apt-get -y install vim

RUN pip install --upgrade pip
RUN pip install "ansible>=2.0,<3.0"

RUN mkdir /sheepdoge-test

WORKDIR /sheepdoge-test

ADD tasks ./tasks
ADD tests/* ./

RUN chmod u+x test.sh
