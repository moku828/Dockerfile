FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y wget git make g++ 
#RUN apt-get install -y lib32z1
#RUN apt-get install -y lib32stdc++
RUN apt-get install -y libc6-dev-i386
WORKDIR /
RUN wget -nv https://www.toppers.jp/download.cgi/asp-1.9.3.tar.gz
RUN tar zxf asp-1.9.3.tar.gz
RUN wget -nv https://www.toppers.jp/download.cgi/asp_arch_sh12a_gcc-1.7.1.tar.gz
RUN tar zxf asp_arch_sh12a_gcc-1.7.1.tar.gz
RUN apt-get install -y vim
WORKDIR /asp
RUN sed -i "s/-m2a-nofpu//g" arch/sh12a_gcc/Makefile.sh2a
RUN find . -type f -print0 | xargs -0 sed -i "s/char_t/char/g"
WORKDIR /asp/cfg/cfg
RUN wget -nv https://www.toppers.jp/download.cgi/cfg-linux-static-1_9_6.gz
RUN gzip -d cfg-linux-static-1_9_6.gz
RUN mv cfg-linux-static-1_9_6 cfg
RUN chmod 755 cfg
WORKDIR /asp/obj
RUN ../configure -T apsh2a_gcc
COPY sh-tools /usr/local/sh-tools/
ENV PATH $PATH:/usr/local/sh-tools/bin
#RUN make depend
#RUN make
ENTRYPOINT ["/bin/bash"]
