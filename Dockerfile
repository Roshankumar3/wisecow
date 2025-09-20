FROM ubuntu:20.04

RUN apt-get update && apt-get install -y fortune cowsay netcat && apt-get clean
RUN rm -rf /var/lib/apt/lists/*

COPY wisecow.sh /wisecow.sh
RUN chmod 755 /wisecow.sh

EXPOSE 4499
CMD ["/wisecow.sh"]
