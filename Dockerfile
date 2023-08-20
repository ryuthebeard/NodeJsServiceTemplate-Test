FROM node:18-alpine

ENV NODE_ENV=production

WORKDIR /app
COPY ["package.json", "yarn.lock*", "./"]

RUN yarn install --frozen-lockfile --production
COPY . .

RUN yarn add global @nestjs/cli

RUN yarn build

CMD ["yarn", "start:prod"]