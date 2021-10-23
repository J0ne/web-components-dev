FROM node:14
WORKDIR /usr/src/app
COPY package* ./
COPY . .
RUN npm install
EXPOSE 8000
RUN npm run storybook:build
COPY ./storybook-static .


