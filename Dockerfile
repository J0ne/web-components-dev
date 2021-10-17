FROM node:14
WORKDIR /usr/src/app
COPY package* ./
RUN npm init @open-wc --type scaffold --scaffoldType app --features linting testing demoing building --typescript false --tagName my-component --writeToDisk true --installDependencies npm 
RUN npm install