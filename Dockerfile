# Stage 1:- Building the application
FROM node:18 AS Builder
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

# Stage 2:- Serving the application through NGINX
FROM nginx:latest 
WORKDIR /usr/share/nginx/html
COPY --from=Builder app/build .
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
