FROM centos

RUN yum list | grep -e ++

RUN yum install -y epel-release

RUN /usr/bin/curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum install -y nodejs
#RUN yum install -y python2 node-gyp gcc make unixODBC
RUN yum install -y python2 
RUN yum install -y gcc
RUN yum install -y gcc-c++.x86_64
RUN yum install -y make 
RUN yum install -y unixODBC
#RUN yum install -y node-gyp 

#RUN npm install -y g++
RUN npm install -g node-gyp


RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN npm i && ln -s /app/node_modules/ /node_modules

ENV PORT 80
EXPOSE 80

CMD ["node", "src/server/server.js"]
#CMD exec /bin/sh -c "trap : TERM INT; (while true; do sleep 1000; done) & wait"