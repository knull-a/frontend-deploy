FROM node:alpine as build

WORKDIR /app

COPY . .

RUN npm i -g pnpm

RUN pnpm i
RUN pnpm build-only

FROM nginx:alpine

COPY --from=build /app/dist /var/www/html

COPY ./deploy/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./deploy/nginx/default.conf /etc/nginx/conf.d/default.conf

RUN chown nginx:nginx /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
