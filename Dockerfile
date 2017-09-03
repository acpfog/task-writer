FROM ubuntu:16.04
MAINTAINER Volodymyr Larkin "vlarkin@gmail.com"

COPY requirements.txt /tmp/
RUN apt-get update
RUN apt-get -y install python-pip python-dev build-essential
RUN pip install -r /tmp/requirements.txt
RUN rm -f /tmp/requirements.txt

RUN mkdir -p /opt/service
COPY writer.py /opt/service/

EXPOSE 5000
WORKDIR /opt/service
ENTRYPOINT ["python"]
CMD ["writer.py"]
