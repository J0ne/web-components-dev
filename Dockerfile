FROM node:14 as builder
WORKDIR /usr/src/app
COPY package* ./
# COPY /storybook-static ./storybook-static
# RUN mkdir /storybook-static
RUN npm install
RUN npm run storybook:build
COPY /storybook-static ./storybook-static

FROM nginx:1.21.3
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /usr/src/app/storybook-static /usr/share/nginx/html

CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'

# FROM nginxinc/nginx-unprivileged
# # COPY nginx.conf /etc/nginx/nginx.conf
# COPY --from=builder /usr/src/app/storybook-static /usr/share/nginx/html

# CMD ["nginx", "-g daemon off;"]

# FROM nginx
# COPY nginx.conf /etc/nginx/nginx.conf
# RUN mkdir -p /www
# COPY --from=builder /usr/src/app/storybook /www