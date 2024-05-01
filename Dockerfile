FROM ubuntu:22.04
MAINTAINER Ankit_Sharma
RUN apt-get update -y && apt-get install git nginx zip curl -y
RUN echo "deamon off:"  >> /etc/nginx/nginx.conf
WORKDIR /var/www/html
RUN curl -o /var/www/html/master.zip -L https://codecloud.github.com/gabrielecirulli/2048/zip/master 
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master.zip
EXPOSE 80
CMD [ "/usr/sbin/nginx" ,"-c" ,"/etc/nginx/nginx.conf"]

