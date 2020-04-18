FROM oraclelinux:7
MAINTAINER Guillaume Le Biller <guillaume.lebiller@traveldoo.com>

RUN yum install -y yum-utils && yum-config-manager --enable ol7_developer_EPEL \
 && yum install -y sudo curl wget gcc make gcc rpm-build rpmdevtools redhat-lsb-core openssl-devel \
 && useradd builder && echo 'builder ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/builder

USER builder
RUN rpmdev-setuptree
WORKDIR /home/builder/rpmbuild

ADD SOURCES/ ./SOURCES/
ADD SPECS/ ./SPECS/

USER root
RUN chown -R builder:builder .

USER builder
CMD ["make", "--directory=./SPECS/", "module-naxsi"]
