FROM centos:centos7

ARG pgpool_link=http://www.pgpool.net/yum/rpms/3.7/redhat/rhel-7-x86_64/pgpool-II-pg96-3.7.3-1pgdg.rhel7.x86_64.rpm
ARG pgpool_rpm=pgpool.rpm

WORKDIR /root

RUN yum update -y \
&& curl $pgpool_link > $pgpool_rpm \ 
&& yum install -y ${pgpool_rpm}

ENV PGPOOL_USER=pgpool
ENV PGPOOL_HOME=/etc/pgpool-II
ENV PGPOOL_RUN=/var/run/pgpool
ENV PGPOOL_LOG=/var/log/pgpool
RUN mkdir ${PGPOOL_LOG} \ 
&& adduser --user-group ${PGPOOL_USER} \
&& usermod --home ${PGPOOL_HOME} ${PGPOOL_USER} \
&& chown -R ${PGPOOL_USER} ${PGPOOL_RUN} ${PGPOOL_LOG} ${PGPOOL_HOME}

USER ${PGPOOL_USER}

WORKDIR ${PGPOOL_HOME}

EXPOSE 9999
EXPOSE 9898

CMD ["pgpool", "-n"]