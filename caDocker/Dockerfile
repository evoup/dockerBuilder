############################################################

# Dockerfile to build ca dev (with cdh4.7.1) container images

# Based on Centos

############################################################
# Set the base image to Centos

#FROM centos:centos6
FROM evoup/centos_ssh_root_jdk
MAINTAINER evoup
RUN echo $'172.18.0.32 hadoop.ca.evoup.com\n\
'\
>> /etc/hosts

RUN echo $'[cloudera-cdh4]\n\
name=Cloudera\'s Distribution for Hadoop, Version 4\n\
baseurl=http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/4/\n\
gpgkey = http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera \n\
gpgcheck = 1 \n\
'\
> /etc/yum.repos.d/cloudera-cdh4.repo
RUN echo $'[cloudera-gplextras4]\n\
# Packages for Cloudera\'s Distribution for Hadoop, Version 4, on RedHator CentOS 6 x86_64\n\
name=Cloudera\'s Distribution for Hadoop, Version 4\n\
baseurl=http://archive.cloudera.com/gplextras/redhat/6/x86_64/gplextras/4/\n\
gpgkey = http://archive.cloudera.com/gplextras/redhat/6/x86_64/gplextras/RPM-GPG-KEY-cloudera\n\
gpgcheck = 1\n\
'\
> /etc/yum.repos.d/cloudera-gplextras4.repo
RUN yum install -y epel-release
RUN yum -y update
RUN rpm --import http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
RUN yum -y install zookeeper-server zookeeper
RUN yum clean all
RUN yum -y install hadoop-0.20-mapreduce-jobtracker
RUN yum clean all
RUN yum -y install hadoop-hdfs-namenode
RUN yum -y install hadoop-0.20-mapreduce-tasktracker hadoop-hdfs-datanode
RUN yum clean all
RUN yum -y install hadoop-client
RUN yum -y install hadoop-lzo-cdh4
RUN yum -y install hadoop-hdfs-fuse 
RUN cp -r /etc/hadoop/conf.dist /etc/hadoop/conf.my_cluster
RUN alternatives --verbose --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.my_cluster 50
RUN alternatives --set hadoop-conf /etc/hadoop/conf.my_cluster

RUN sed -i '/<configuration>/a \ \ <property>\n    <name>fs.defaultFS<name>\n    <value>hdfs://localhost<value>\n  </property>  \n  <property>\n    <name>io.compression.codecs</name>\n    <value>org.apache.hadoop.io.compress.DefaultCodec,org.apache.hadoop.io.compress.GzipCodec,org.apache.hadoop.io.compress.BZip2Codec,com.hadoop.compression.lzo.LzoCodec,com.hadoop.compression.lzo.LzopCodec,org.apache.hadoop.io.compress.SnappyCodec</value>\n  <property>' /etc/hadoop/conf/core-site.xml
