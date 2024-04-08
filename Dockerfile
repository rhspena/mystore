# Stage 1: Compile and Build angular codebase
FROM registry.access.redhat.com/ubi9/nodejs-18:1-98.1711398651 as build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install -g npm@10.5.1
USER root
COPY . .
RUN chmod -R 777 /usr/src/app
RUN npm run build

# Stage 2: Serve app with nginx server
FROM registry.access.redhat.com/ubi9/nginx-122:1-59
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/browser /usr/share/nginx/html
EXPOSE 8080
CMD nginx -g "daemon off;"