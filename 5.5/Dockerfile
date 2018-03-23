FROM ubuntu:trusty

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list
RUN apt-get update

RUN dpkg-divert --local --rename --add /sbin/initctl

RUN apt-get install -y mysql-common
RUN DEBIAN_FRONTEND=noninteractive apt-get install -q -y mysql-server

RUN sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf

RUN find /var/lib/mysql -type f -exec touch {} \; \
    && service mysql restart \
    && mysql -u root -h localhost --port 3306 -e "grant all privileges on *.* to root@'%';" \
    || cat  /var/log/mysql/error.log

EXPOSE 3306

COPY start_mysqld.sh /root/start_mysqld.sh

RUN cat /etc/mysql/my.cnf

CMD ["/root/start_mysqld.sh"]
