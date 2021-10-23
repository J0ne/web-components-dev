FROM node:14
WORKDIR /usr/src/app
COPY package* ./
RUN mkdir /storybook-static
RUN npm install
RUN npm run storybook:build
VOLUME /storybook-static

FROM nginx
WORKDIR /usr/src/app
COPY ./storybook-static /usr/share/nginx/html