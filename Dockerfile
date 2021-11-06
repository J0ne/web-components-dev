FROM node:14 as builder
WORKDIR /usr/src/app
COPY package* ./
RUN npm install
RUN npm run storybook:build
COPY /storybook-static ./storybook-static

FROM node:slim
COPY --from=builder /usr/src/app/storybook-static /usr/src/app
RUN npm i -g serve
CMD ["serve","-l", "$PORT", "/usr/src/app"]