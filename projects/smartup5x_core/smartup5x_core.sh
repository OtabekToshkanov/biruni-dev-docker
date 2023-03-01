#!/bin/sh

cp /opt/tomcat/projects/smartup5x_core/lib/*.jar /opt/tomcat/webapps/smartup5x_core/WEB-INF/lib/

exec "$@"