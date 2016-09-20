FROM centos:centos6
MAINTAINER evoup
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install createrepo
RUN mkdir /yumload
RUN createrepo yumload
RUN yum -y install httpd
RUN ln -s /yumload /var/www/html/yumload
RUN echo $'service httpd start\n\
'\
>> /root/.bashrc
RUN echo $'[mylocalrepo]\n\
baseurl=http://0.0.0.0/yumload\n\
gpgcheck=0\n\
'\ 
>> /etc/yum.repos.d/local.repo
