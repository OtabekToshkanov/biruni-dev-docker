# Centos based container with Java and Tomcat
FROM centos:centos7

# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar

# Prepare environment 
ENV JAVA_HOME /usr/java/latest
ENV CATALINA_HOME /opt/tomcat 
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# Install Oracle Java17
ENV JAVA_VERSION 17

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
 https://download.oracle.com/java/${JAVA_VERSION}/latest/jdk-17_linux-x64_bin.rpm && \
 yum -y localinstall jdk*

# Install Tomcat
ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.71

RUN wget https://dlcdn.apache.org/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
 tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
 rm apache-tomcat*.tar.gz && \
 mv apache-tomcat* ${CATALINA_HOME}

RUN chmod +x ${CATALINA_HOME}/bin/*sh

WORKDIR /opt/tomcat

# Copying biruni files
COPY ./biruni5x/ ./webapps/smartup5x_trade/
COPY ./projects/smartup5x_trade/WEB-INF ./webapps/smartup5x_trade/WEB-INF
COPY ./biruni5x_libs/* ./lib/ 

# copying default properties
# TODO now working because container override when valume binded
COPY ./projects/smartup5x_trade/smartup5x_trade.properties ./projects/biruni/





RUN rm -f conf/tomcat-users.xml
COPY tomcat-conf/ conf/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]