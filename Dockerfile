FROM node:alpine as builder
USER root

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html