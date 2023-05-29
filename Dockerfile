FROM ubuntu:12.04
# add mod_perl
ARG perl_prefix=/usr/local
ARG perl_version=5.22.4

RUN sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
#RUN sed -i 's/security/old-releases/g' /etc/apt/sources.list

RUN apt-get update && apt-get install apt-utils perl=5.14.2-6ubuntu2.11 libthread-queue-any-perl apache2=2.2.22-1ubuntu1.15 libapache2-mod-perl2=2.0.5-5ubuntu1.1 -y
RUN apt-get install -y build-essential libgd2-xpm-dev  libmysqlclient-dev zlib1g zlib1g-dev libexpat1-dev  libdbix-password-perl
#ADD app.psgi /usr/local/apache2/perl/
#ADD httpd-mod_perl.conf /usr/local/apache2/conf/extra/

#RUN echo 'Include conf/extra/httpd-mod_perl.conf' >> /usr/local/apache2/conf/httpd.conf

EXPOSE 80
#RUN service apache2 restart

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

