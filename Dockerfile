FROM debian:latest


EXPOSE 8080


RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install curl gnupg2 wget apt -y
RUN apt-get update -y
RUN apt-get install fontconfig openjdk-11-jre -y
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update -y
RUN apt-get  install jenkins -y
