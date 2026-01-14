FROM httpd:2.4

# Copy website files to Apache document root
COPY *.html /usr/local/apache2/htdocs/ 
COPY Screenshots /usr/local/apache2/htdocs/Screenshots/
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Expose port 3000
EXPOSE 3000

# Start Apache in the foregroundq
CMD ["httpd-foreground"]
