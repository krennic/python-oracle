FROM python:2.7.13

ENV ORACLE_HOME=/opt/oracle/instantclient_12_2
ENV PATH=$PATH:$ORACLE_HOME
ENV LD_LIBRARY_PATH=$ORACLE_HOME
ENV ARCHFLAGS="-arch x86_64"

WORKDIR /opt/oracle

RUN wget https://ufile.io/jutcm -O instantclient_12_2.tar.gz && \
	tar -xzf instantclient_12_2.tar.gz &&\
	rm instantclient_12_2.tar.gz &&\
	chmod -R 655 $ORACLE_HOME && \
	cd instantclient_12_2 &&\
	ln -s libclntsh.dylib.12.1 libclntsh.dylib && \
	ln -s libclntsh.so.12.1 libclntsh.so && \
	ln -s libocci.dylib.12.1 libocci.dylib && \
	apt-get update && \
	apt-get install libaio1 libaio-dev && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /workspace