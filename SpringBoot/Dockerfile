FROM java:8

MAINTAINER Mayara Gouveia 

VOLUME /tmp
EXPOSE 8090

ENV SPRING_PROFILES_ACTIVE dev
ENV USER_NAME user
ENV APP_HOME /home/$USER_NAME/app

RUN useradd -ms /bin/bash $USER_NAME
RUN mkdir $APP_HOME
RUN mkdir /home/$USER_NAME/app/files
RUN chmod 777 /home/$USER_NAME/app/files/

ADD target/*.war $APP_HOME/file.war
RUN chown $USER_NAME $APP_HOME/file.war

USER $USER_NAME
WORKDIR $APP_HOME
RUN bash -c 'touch file.war'

ENTRYPOINT ["java","-jar","-Dspring.profiles.active=dev","file.war"]
