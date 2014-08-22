FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget make gcc binutils python-pip python-dev libssl-dev python-cffi
RUN apt-get install haproxy -y
WORKDIR /root

RUN pip install python-etcd Jinja2
RUN touch /var/run/haproxy.pid

ADD . /app

WORKDIR /app

EXPOSE 1936

CMD ["python", "main.py"]
