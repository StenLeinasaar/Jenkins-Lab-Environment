# Use a lightweight web server
FROM nginx:alpine

# Copy the static HTML files to the Nginx server
COPY src/ /usr/share/nginx/html


# Expose port 80 to access the frontend
EXPOSE 80

# Start Nginx (Optional, since it's the default in the image)
CMD ["nginx", "-g", "daemon off;"]