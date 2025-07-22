FROM node:18

WORKDIR /app

COPY . .

RUN npm install

ENV NODE_ENV=production
ENV APP_KEYS=key1,key2,key3,key4
ENV API_TOKEN_SALT=somerandomsalt
ENV ADMIN_JWT_SECRET=randomjwtsecret
ENV JWT_SECRET=randomjwtsecret

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]
