# Use a lightweight web server image
FROM nginx:alpine

# Copy your static index.html into the default nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx (comes preconfigured)
CMD ["nginx", "-g", "daemon off;"]