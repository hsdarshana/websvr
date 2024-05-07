# Use an official apache image
FROM httpd:latest

# Copy html files from repo to web server 
COPY ./website/index.html /usr/local/apache2/htdocs/



