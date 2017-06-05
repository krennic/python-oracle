FROM python:2.7.13

RUN apt-get update && \
	apt-get install libaio1 libaio-dev zip && \
	rm -rf /var/lib/apt/lists/*