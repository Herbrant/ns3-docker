FROM debian:stable-slim

RUN apt-get -y update && \
    apt-get -y install \
        build-essential \
        cmake \
        python3 \
        tar \
        bzip2 \
        curl

RUN curl https://www.nsnam.org/releases/ns-allinone-3.38.tar.bz2 > ns-allinone-3.38.tar.bz2 && \
    mkdir -p /ns3 && \
    tar xf ns-allinone-3.38.tar.bz2 -C /ns3 --strip-components=1 && \
    rm -f ns-allinone-3.38.tar.bz2

WORKDIR /ns3

RUN cd /ns3/ns-3.38/ && \
    ./ns3 configure --enable-examples --enable-tests && \
    ./ns3 build

ENTRYPOINT [ "/ns3/ns-3.38/ns3", "run"]

