# Watch lecture 71 to learn about this demo app.
FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["node", "app.js"]