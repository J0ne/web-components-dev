FROM node:14 as builder
WORKDIR /usr/src/app
COPY package* ./
RUN npm install
RUN npm run storybook:build
COPY /storybook-static ./storybook-static

FROM nginxinc/nginx-unprivileged
COPY --from=builder /usr/src/app/storybook-static /usr/share/nginx/html

CMD ["nginx", "-g daemon off;"]

