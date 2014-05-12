FROM dockerfile/java
MAINTAINER Christopher J Lyth <cjlyth@gmail.com>
WORKDIR /opt

ENV JETTY_VERSION 8.1.15.v20140411
RUN wget http://download.eclipse.org/jetty/$JETTY_VERSION/dist/jetty-distribution-$JETTY_VERSION.tar.gz
RUN tar xfz jetty-distribution-$JETTY_VERSION.tar.gz
RUN ln -s /opt/jetty-distribution-$JETTY_VERSION /opt/jetty

ADD etc /opt/jetty/etc
ADD start.ini /opt/jetty/

CMD ["-d", "supervise"]
ENTRYPOINT ["/opt/jetty/bin/jetty.sh"]
