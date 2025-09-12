# Use Tomcat 11 + Java 17
FROM tomcat:11.0-jdk17

# Remove default Tomcat homepage
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file as ROOT app
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8081
EXPOSE 8081

# Tell Tomcat to run on port 8081 instead of 8080
RUN sed -i 's/8080/8081/g' /usr/local/tomcat/conf/server.xml

# Start Tomcat
CMD ["catalina.sh","run"]
