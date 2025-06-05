# Stage 1: Clone the repo using an image with git
#FROM alpine AS builder
#RUN apk add --no-cache git

# Stage 2: Serve with nginx
FROM nginx
COPY src/index.html /usr/share/nginx/html/index.html

