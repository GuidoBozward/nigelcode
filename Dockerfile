FROM ubuntu:22.04

# Install Apache web server
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite
RUN a2enmod ssl

# Set ServerName to suppress warning
RUN echo "ServerName testme" >> /etc/apache2/apache2.conf

# Copy website files to Apache document root
COPY *.html /var/www/html/
COPY Screenshots /var/www/html/Screenshots/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 8080
EXPOSE 8080

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
