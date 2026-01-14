FROM httpd:2.4

# Copy website files to Apache document root
COPY *.html /usr/local/apache2/htdocs/ 
COPY Screenshots /usr/local/apache2/htdocs/Screenshots/

# Expose port 80
EXPOSE 3000

# Start Apache in the foreground
CMD ["httpd-foreground"]
