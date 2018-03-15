FROM ubuntu:latest
MAINTAINER Surya Rajasekaran "srajasekaran@scu.edu"
RUN apt-get update -y
RUN apt-get install -y python2.7
RUN apt-get install -y python-pip
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]