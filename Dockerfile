# Establish the builder phase.  Note no volume setup.  
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
# COPY all source directly into the container
COPY . .
# Ouput will be build directory /app/build
RUN npm run build

# Second from statement says previous block all complete
FROM nginx
# Per the instructions from gitHub
COPY --from=builder /app/build /usr/share/nginx/html
#Default command for nginx will start up nginx

