#!/bin/sh

cp /opt/tomcat/projects/smartup5x_core/lib/*.jar /opt/tomcat/webapps/smartup5x_trade/WEB-INF/lib/
cp /opt/tomcat/projects/smartup5x_anor/lib/*.jar /opt/tomcat/webapps/smartup5x_trade/WEB-INF/lib/
cp /opt/tomcat/projects/smartup5x_trade/lib/*.jar /opt/tomcat/webapps/smartup5x_trade/WEB-INF/lib/

exec "$@"