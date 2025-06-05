# Stage 1: Clone the repo using an image with git
FROM alpine AS builder
RUN apk add --no-cache git
WORKDIR /app
RUN git clone https://github.com/ZarrTech/DevOps_portfolio.git

# Stage 2: Serve with nginx
FROM nginx
COPY --from=builder /app/DevOps_portfolio/index.html /usr/share/nginx/html/index.html

