FROM nginx:stable-alpine
LABEL org.opencontainers.image.source="https://github.com/GuidoBozward/nigelcode"
WORKDIR /usr/share/nginx/html

# Remove default nginx content and copy workspace files into the web root
RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html

# Expose HTTP port and run nginx in the foreground
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
