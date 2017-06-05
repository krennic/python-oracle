FROM python:2.7.13

RUN apt-get update && \
	apt-get install libaio1 libaio-dev && \
	rm -rf /var/lib/apt/lists/*