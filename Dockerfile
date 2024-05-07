# Use an official apache image
FROM httpd:latest

EXPOSE 80

# Copy html files from repo to web server 
COPY ./website/index.html /usr/local/apache2/htdocs/



