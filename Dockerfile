FROM node:14 as builder
WORKDIR /usr/src/app
COPY package* ./
# COPY /storybook-static ./storybook-static
# RUN mkdir /storybook-static
RUN npm install
RUN npm run storybook:build
COPY /storybook-static ./storybook-static

FROM ubuntu:latest
RUN apt-get update
RUN apt-get install nginx -y
COPY --from=builder /usr/src/app/storybook-static /var/www/html/
EXPOSE 80
CMD ["nginx", "-g daemon off;"]

# FROM nginx
# COPY nginx.conf /etc/nginx/nginx.conf
# RUN mkdir -p /www
# COPY --from=builder /usr/src/app/storybook /www