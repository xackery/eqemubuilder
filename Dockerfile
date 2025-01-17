FROM ubuntu:16.04

RUN apt-get -y update && apt-get install -y build-essential gcc-5 g++-5 libtool cmake curl debconf-utils git git-core libio-stringy-perl liblua5.1 liblua5.1-dev libluabind-dev libmysql++ libperl-dev libperl5i-perl libwtdbomysql-dev libsodium-dev libsodium18 libmysqlclient-dev lua5.1 minizip make mariadb-client nano open-vm-tools unzip uuid-dev zlibc wget && apt-get -y upgrade

COPY protoc /usr/bin/protoc
COPY googleapis /googleapis
COPY protobuf/src /protobuf
COPY protoc-gen-grpc-gateway /bin/protoc-gen-grpc-gateway
COPY protoc-gen-go /bin/protoc-gen-go
COPY libprotobuf.so.17 /usr/lib/libprotobuf.so.17
COPY libprotoc.so.17 /usr/lib/libprotoc.so.17
RUN echo "/usr/lib/libprotobuf.so.17" > /etc/ld.so.conf.d/libprotobuf.conf
RUN echo "/usr/lib/libprotoc.so.17" >> /etc/ld.so.conf.d/libprotobuf.conf
RUN ldconfig

ENV HOME /src
WORKDIR /src

# Define default command.
CMD ["make"]