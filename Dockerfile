FROM centos
MAINTAINER revathi <basanirevathi8@gmail.com>
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN yum install java -y && yum install wget unzip -y && yum install git -y && yum install maven -y
RUN java -version && mvn -version
RUN git clone https://github.com/revathibasani/maven-web-application.git
RUN ls
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.54/bin/apache-tomcat-9.0.54.tar.gz .
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.54  tomcat9
RUN rm -rf apache-tomcat-9.0.54.tar.gz
RUN ls
RUN cd  /opt/tomcat/tomcat9
RUN ls
WORKDIR /opt/tomcat/maven-web-application
RUN ls
RUN mvn clean package
WORKDIR /opt/tomcat/maven-web-application/target/
RUN cp maven-web-application.war /opt/tomcat/tomcat9/webapps/maven-web-application.war
EXPOSE 9000
RUN sed -i '/<\/tomcat-users>/ i\<user username="admin" password="password" roles="admin-gui,manager-gui,manager-script"/>' /opt/tomcat/tomcat9/conf/tomcat-users.xml
WORKDIR /opt/tomcat/tomcat9/bin
CMD ["sh","catalina.sh","run"]
