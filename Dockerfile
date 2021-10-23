FROM node:14
WORKDIR /usr/src/app
COPY package* ./
RUN mkdir /storybook-static
RUN npm install
RUN npm run storybook:build
COPY ./storybook-static .

FROM nginx
COPY . /usr/share/nginx/html