FROM node:14 as builder
WORKDIR /usr/src/app
COPY package* ./
COPY /storybook-static ./storybook-static
# RUN mkdir /storybook-static
RUN npm install
RUN npm run storybook:build


FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /www
COPY --from=builder /usr/src/app/storybook-static /www