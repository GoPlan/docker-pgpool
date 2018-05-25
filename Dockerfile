FROM centos:centos7

WORKDIR /root

ENV POSTGRE_MAJOR=pg96

ENV PGPOOL_DOWNLOAD=http://www.pgpool.net/yum/rpms/3.7/redhat/rhel-7-x86_64
ENV PGPOOL_LINK=${PGPOOL_DOWNLOAD}/pgpool-II-${PG_MAJOR}-3.7.3-1pgdg.rhel7.x86_64.rpm
ENV PGPOOL_RPM=pgpool.rpm

RUN yum update -y \
&& curl ${PGPOOL_LINK} > ${PGPOOL_RPM} \ 
&& yum install -y ${PGPOOL_RPM}

ENV PGPOOL_USER=pgpool
ENV PGPOOL_GROUP=pgpool