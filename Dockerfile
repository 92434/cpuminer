FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
	automake \
	libcurl4-openssl-dev \
	git \
	make
RUN git clone https://github.com/92434/cpuminer2 /; \
	pwd

RUN cd cpuminer; \
    ./autogen.sh; \
    ./configure CFLAGS="-O3"; \
    make; \
	make install

WORKDIR         /cpuminer
ENTRYPOINT      ["./minerd"]
