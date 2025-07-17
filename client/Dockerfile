# # Stage 1: Build React App
# FROM node:18-alpine AS build
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# # Optional: pass REACT_APP_API as build arg
# ARG REACT_APP_API_URL
# ENV REACT_APP_API=$REACT_APP_API_URL
# RUN npm run build
# # Stage 2: Serve with NGINX
# FROM nginx:alpine
# #COPY default.conf /etc/nginx/conf.d/default.conf
# COPY --from=build /app/build /usr/share/nginx/html
# RUN chmod -R 755 /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]


# Stage 1: Build the Angular application
FROM node:22-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the Angular application
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
EXPOSE 5000
ENTRYPOINT ["/entrypoint.sh"]
