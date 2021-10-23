FROM node:14
WORKDIR /usr/src/app
COPY package* ./
COPY . .
RUN npm install
ENTRYPOINT [ "npm", "run", "storybook" ]

