# Use the official Nginx image as the base image
FROM nginx

# Copy your application files into the default Nginx web root
COPY . /usr/share/nginx/html/

# Expose port 80, which is the default HTTP port for Nginx
EXPOSE 80

# The CMD instruction specifies what command to run when the container starts.
# In this case, we start Nginx in the foreground.
CMD ["nginx", "-g", "daemon off;"]

