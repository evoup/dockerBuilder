FROM centos:centos6
MAINTAINER evoup
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install createrepo
RUN mkdir /yumload
createrepo yumload
RUN yum -y install httpd
RUN ln -s /var/www/html/yumload /yumload
RUN echo $'[mylocalrepo]\n\
baseurl=http://0.0.0.0/yumload\n\
gpgcheck=0\n\
'\ 
>> /etc/yum.repos.d/local.repo

