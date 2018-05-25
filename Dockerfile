FROM centos:centos7

ARG pgpool_link=http://www.pgpool.net/yum/rpms/3.7/redhat/rhel-7-x86_64/pgpool-II-pg96-3.7.3-1pgdg.rhel7.x86_64.rpm
ARG pgpool_rpm=pgpool.rpm

WORKDIR /root

RUN yum update -y \
&& curl $pgpool_link > $pgpool_rpm \ 
&& yum install -y ${pgpool_rpm}

ENV PGPOOL_USER=pgpool
ENV PGPOOL_HOME=/usr/local/pgpool
ENV PGPOOL_RUN=/var/run/pgpool
RUN adduser -U -md ${PGPOOL_HOME} ${PGPOOL_USER} \
&& chown ${PGPOOL_USER} ${PGPOOL_RUN}

USER ${PGPOOL_USER}

COPY pgpool-II ${PGPOOL_HOME} 

EXPOSE 9999
EXPOSE 9898

CMD ["pgpool", "-n"]