FROM ubuntu:bionic
MAINTAINER csk0411@gmail.com

ADD https://github.com/ccconnor/go-wanchain/releases/download/wanchain_test/wanchain_test.tar.gz /tmp/

RUN cd /tmp && tar xvf wanchain_test.tar.gz && cp -r /tmp/wanchain_test/* /usr/local/bin && rm -rf /tmp/*

EXPOSE 8545
EXPOSE 17717

COPY rootfs /

ENTRYPOINT ["gwan","--pluto","--datadir","/data","--password","/data/pwdFile","--mine","--rpc","--rpcaddr","0.0.0.0","--rpcapi","eth,personal,net,admin,wan,txpool,pos","--nodiscover","--verbosity","5"]
