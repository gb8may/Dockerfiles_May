FROM node:10

MAINTAINER Mayara Gouveia 

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN sed '/jessie-updates/s/^/# /' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -yq google-chrome-stable

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

COPY package.json /usr/src/app/package.json
RUN npm install
RUN npm install @angular/cli --save-dev
RUN npm install node-gyp -g
RUN npm install -g --unsafe-perm --verbose @angular/cli@1.7.1

COPY . /usr/src/app

CMD ng serve --host 0.0.0.0 --disable-host-check
