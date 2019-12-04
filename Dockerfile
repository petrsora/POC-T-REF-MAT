FROM centos

RUN yum install -y  epel-release

#https://tech.amikelive.com/node-663/quick-tip-installing-nodejs-8-on-centos-7/
#RUN yum install curl
#RUN yum remove -y nodejs npm
#RUN /usr/bin/curl -sL https://rpm.nodesource.com/setup_8.x | bash -
RUN /usr/bin/curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum install -y nodejs

#RUN yum install -y   npm python2 node-gyp gcc make unixODBC
RUN yum install -y python2 node-gyp gcc make unixODBC

RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN npm i  && ln -s /app/node_modules/ /node_modules

ENV PORT 80
EXPOSE 80

CMD ["node", "src/server/server.js"]
#CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"






#FROM centos
#
#RUN yum list | grep -e g++ -e gcc -e c++
#
#RUN yum install -y epel-release
#
#RUN /usr/bin/curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
#RUN yum install -y nodejs
##RUN yum install -y python2 node-gyp gcc make unixODBC
#RUN yum install -y python2 
##RUN yum install -y gcc
#RUN yum install -y gcc-c++.x86_64
#RUN yum install -y make 
#RUN yum install -y unixODBC
##RUN yum install -y node-gyp 
#
##RUN npm install -y g++
#RUN npm install -g node-gyp
#
#
#RUN mkdir -p /app
#WORKDIR /app
#COPY . /app
#
#RUN npm i && ln -s /app/node_modules/ /node_modules
#
#ENV PORT 80
#EXPOSE 80
#
#CMD ["node", "src/server/server.js"]
##CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"