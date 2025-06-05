# Stage 1: Clone the repo using an image with git
FROM alpine AS builder
RUN apk add --no-cache git
WORKDIR /app
RUN git clone https://github.com/ZarrTech/minikube_html_dep.git

# Stage 2: Serve with nginx
FROM nginx
COPY --from=builder /app/minikube_html_dep/src/index.html /usr/share/nginx/html/index.html

